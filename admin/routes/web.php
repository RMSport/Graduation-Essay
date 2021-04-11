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

Route::get('/', function(){
    return view('login');
});

Route::post('login', [
	'as'=>'login',
	'uses'=>'App\Http\Controllers\PageController@postLogin'
]);

Route::post('logout', [
	'as'=>'logout',
	'uses'=>'App\Http\Controllers\PageController@getLogout'
]);


Route::get('index',[
    'as'=>'index',
    'uses'=>'App\Http\Controllers\PageController@getIndex'
]);


