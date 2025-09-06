import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture
  });

  //Helper function to get the full name,
  String get fullName => '$firstName $lastName';

  //Helper function to format phone number.
  String get formattedNumber => EFormatter.formatPhoneNumber(phoneNumber);

  //Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  //Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername ='$firstName$lastName'; // Combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // Add "cat_" prefix
    return usernameWithPrefix;
  }

  //Static function to create an empty user model.
  static UserModel empty() => UserModel(email: "", firstName: "", lastName: "", id: "", phoneNumber: "", profilePicture: "", username: "");

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'username': username,
    'email': email,
    'phoneNumber': phoneNumber,
    'profilePicture': profilePicture
  };

  //Factory method to create a UserModel from a firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id, 
        firstName: data['firstName'] ?? '', 
        lastName: data['lastName'] ?? '', 
        username: data['username'] ?? '', 
        email: data['email'] ?? '', 
        phoneNumber: data['phoneNumber'] ?? '', 
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
} 