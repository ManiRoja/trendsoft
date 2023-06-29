<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use App\Http\Controllers\UserController;

Route::get('/', [UserController::class, 'allUsers']);
Route::get('/createUser', [UserController::class, 'createUser']);
Route::post('/addUser', [UserController::class, 'addUser']);
Route::get('/editUser/{id}', [UserController::class, 'editUser']);
Route::post('/updateUser/{id}', [UserController::class, 'updateUser']);
Route::get('/deleteUser/{id}', [UserController::class, 'deleteUser']);