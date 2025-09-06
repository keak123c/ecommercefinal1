import 'dart:convert'; // For jsonEncode, jsonDecode
import 'dart:io'; // For HttpStatus, HttpHeaders
import 'dart:async'; // For TimeoutException
import 'package:http/http.dart' as http;
// Removed: import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// It's good practice to also import kDebugMode if you use it for conditional URLs
// import 'package:flutter/foundation.dart';


// --- Custom Exception Classes (Good Practice) ---
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic errors; // For validation errors or detailed error responses

  ApiException(this.message, {this.statusCode, this.errors});

  @override
  String toString() {
    return 'ApiException: $message (Status Code: $statusCode, Errors: $errors)';
  }
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}


// --- API Service Class ---
class ApiService {
  // --- Configuration ---
  static const String _androidEmulatorBaseUrl = "http://127.0.0.1:8000/product";
  static const String _iosSimulatorBaseUrl = "http://localhost:8000/students";
  String get _baseUrl {
    if (Platform.isAndroid) {
      return _androidEmulatorBaseUrl;
    } else if (Platform.isIOS) {
      return _iosSimulatorBaseUrl;
    }
    return "https://your.deployed.api.url/api"; // IMPORTANT: Update this for production
  }

  // In-memory token storage (lost on app close or service re-instantiation)
  String? _authToken;

  final Duration _defaultTimeout = const Duration(seconds: 15);

  // --- Helper for Auth Token (In-Memory) ---
  String? _getAuthToken() {
    return _authToken;
  }

  void _saveAuthToken(String token) {
    _authToken = token;
  }

  void _deleteAuthToken() {
    _authToken = null;
  }

  // --- Helper for Headers ---
  Map<String, String> _getHeaders({bool requiresAuth = false, bool isJsonContent = true}) {
    final headers = <String, String>{};
    if (isJsonContent) {
      headers[HttpHeaders.contentTypeHeader] = 'application/json; charset=UTF-8';
    }
    headers[HttpHeaders.acceptHeader] = 'application/json';

    if (requiresAuth) {
      final token = _getAuthToken(); // Get from in-memory variable
      if (token != null && token.isNotEmpty) {
        headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      } else {
        print("Warning: Authentication required, but no token was found in memory.");
      }
    }
    return headers;
  }

  // --- Generic Response Handler ---
  Future<dynamic> _handleResponse(http.Response response) async {
    final String responseBodyString = response.body;
    dynamic responseBody;

    try {
      if (responseBodyString.isNotEmpty) {
        responseBody = jsonDecode(responseBodyString);
      } else {
        responseBody = null;
      }
    } catch (e) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("Warning: Could not decode JSON response for a successful request. Body: $responseBodyString");
      }
      throw ApiException('Invalid response format from server.', statusCode: response.statusCode, errors: responseBodyString);
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.statusCode == HttpStatus.noContent) { // 204
        return null;
      }
      return responseBody;
    } else if (response.statusCode == HttpStatus.unauthorized) { // 401
      _deleteAuthToken(); // Clear in-memory token
      throw ApiException('Unauthorized. Please login again.', statusCode: response.statusCode, errors: responseBody);
    } else if (response.statusCode == HttpStatus.forbidden) { // 403
      throw ApiException('Forbidden. You do not have permission to access this resource.', statusCode: response.statusCode, errors: responseBody);
    } else if (response.statusCode == HttpStatus.notFound) { // 404
      throw ApiException('The requested resource was not found.', statusCode: response.statusCode, errors: responseBody);
    } else if (response.statusCode == HttpStatus.unprocessableEntity) { // 422
      throw ApiException('Validation Error. Please check your input.', statusCode: response.statusCode, errors: responseBody?['errors'] ?? responseBody);
    } else if (response.statusCode >= 500) { // Server errors
      throw ApiException('A server error occurred. Please try again later.', statusCode: response.statusCode, errors: responseBody);
    }
    else {
      throw ApiException(
          responseBody?['message']?.toString() ?? 'An unexpected API error occurred.',
          statusCode: response.statusCode,
          errors: responseBody
      );
    }
  }

  // --- Public API Methods ---

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: _getHeaders(), // Uses the new synchronous _getHeaders()
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      ).timeout(_defaultTimeout);

      final responseData = await _handleResponse(response) as Map<String, dynamic>;

      final String? token = responseData['token']?.toString() ?? responseData['access_token']?.toString();
      if (token != null) {
        _saveAuthToken(token); // Save to in-memory variable
      } else {
        print("Warning: Token not found in successful login response. Response: $responseData");
      }
      return responseData;
    } on SocketException {
      throw NetworkException('No Internet connection or server unreachable. Please check your network.');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } on TimeoutException {
      throw NetworkException('The request timed out. Please try again.');
    }
  }

  Future<void> logout() async {
    final String? token = _getAuthToken();
    if (token != null) {
      try {
        await http.post( // No need to store response if backend invalidates token
          Uri.parse('$_baseUrl/logout'),
          headers: _getHeaders(requiresAuth: true),
        ).timeout(const Duration(seconds: 10));
        // We don't necessarily need to call _handleResponse if the backend simply
        // invalidates the token and returns 200/204, and we don't care about the body.
        // If your logout returns important data or can fail meaningfully, use _handleResponse.
      } on SocketException {
        print('Network error during logout. Local session will be cleared.');
      } on http.ClientException catch (e) {
        print('Client error during logout: ${e.message}. Local session will be cleared.');
      } on TimeoutException {
        print('Logout request timed out. Local session will be cleared.');
      } on ApiException catch (e) { // If _handleResponse was used and threw
        print('API error during logout: ${e.message}. Local session will be cleared.');
      }
    }
    _deleteAuthToken(); // Always clear local in-memory token
  }
}