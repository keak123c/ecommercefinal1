<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentController;
use App\Models\Items;
use App\Http\Controllers\ItemsController;
use App\Http\Controllers\ProductController;

Route::get('/Students', function () {
    return view('welcome');
});
Route::get('/product', [ProductController::class, 'index']);
