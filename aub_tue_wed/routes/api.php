<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\StudentApiController;
use App\Http\Controllers\Api\ItemController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ItemApiController;
use App\Http\Controllers\CoffeeApiController;
use App\Http\Controllers\ProductController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::apiResource('Coffee', CoffeeApiController::class);
Route::apiResource('items', ItemApiController::class);
Route::apiResource('products', ProductController::class);