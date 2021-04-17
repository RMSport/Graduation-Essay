<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\GoogleController;

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

Route::get('/', function () {
    return view('home-02');
});

Route::get('index',[
    'as'=>'home-02',
    'uses'=>'App\Http\Controllers\PageController@getIndex' 
]);
Route::get('login', function(){
    return view('pages.login');
});

Route::post('login', [
	'as'=>'login',
	'uses'=>'App\Http\Controllers\PageController@postLogin'
]);

Route::get('register', function(){
    return view('pages.register');
});

Route::post('register', [
	'as'=>'register',
	'uses'=>'App\Http\Controllers\PageController@postRegister'
]);

Route::get('demo', '\App\Http\Controllers\DemoModelController@index');
Route::get('auth/google', 'App\Http\Controllers\Auth\GoogleController@redirectToGoogle');
Route::get('auth/google/callback', 'App\Http\Controllers\Auth\GoogleController@handleGoogleCallback');

Route::get('search', [
	'as'=>'search',
	'uses'=>'App\Http\Controllers\PageController@getSearch'
]); 