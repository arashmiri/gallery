<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\categoriesController;
use App\Http\Controllers\Admin\OrdersController;
use App\Http\Controllers\Admin\PaymentsController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\Admin\ProductsController;
use App\Http\Controllers\Admin\UsersController;
use App\Http\Controllers\Home\BasketController;
use App\Http\Controllers\Home\CheckoutController;
use App\Http\Controllers\Home\HomeController;
use App\Http\Controllers\Home\ProductsController as ProductsHomeController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Authentication\AuthenticationController;
use App\Http\Controllers\Dashboard\DashboardController;

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

Route::prefix('')->group(function()
{
    Route::get('' , [ProductsHomeController::class , 'index'])->name('home.index');
    Route::get('{product_id}/show' , [ProductsHomeController::class , 'show'])->name('home.product.show');
    Route::get('{product_id}/addToBasket' , [BasketController::class , 'addToBasket'])->name('home.basket.add');
    Route::get('{product_id}/removeFromBasket' , [BasketController::class , 'removeFromBasket'])->name('home.basket.remove');
    Route::get('checkout' , [CheckoutController::class , 'show'])->name('home.checkout');
    
});

Route::prefix('/admin')->group(function()
{

    Route::get('' , [AdminController::class , 'index'])->name('admin.index')->middleware('auth.basic');

    Route::prefix('categories')->group(function()
    {
        Route::get('', [categoriesController::class , 'all'] )->name('admin.categories.all');

        Route::get('create', [categoriesController::class , 'index'] )->name('admin.categories.new');
        Route::post('create', [categoriesController::class , 'create'] )->name('admin.categories.create');
        
        Route::delete('{category_id}/delete' , [categoriesController::class , 'delete'])->name('admin.categories.delete');

        Route::get('{category_id}/edit' , [categoriesController::class , 'edit'])->name('admin.categories.edit');
        Route::put('{category_id}/update' , [categoriesController::class , 'update'])->name('admin.categories.update');
    });

    Route::prefix('products')->group(function()
    {
        Route::get('' , [ProductsController::class , 'all'])->name('admin.products.all');
        Route::get('create', [ProductsController::class , 'create'] )->name('admin.products.create');
        Route::post('create', [ProductsController::class , 'add2'] )->name('admin.products.store');
        Route::delete('delete/{product_id}', [ProductsController::class , 'delete'])->name('admin.products.delete');
        Route::get('{product_id}/edit', [ProductsController::class , 'edit'])->name('admin.products.edit');
        Route::put('{product_id}/update' , [ProductsController::class , 'update'])->name('admin.product.update');

        Route::get('{product_id}/download/demo' , [ProductsController::class , 'downloadDemo'])->name('admin.products.download.demo');
        Route::get('{product_id}/download/source' , [ProductsController::class , 'downloadSource'])->name('admin.products.download.source');
    });

    Route::prefix('users')->group(function()
    {
        Route::get('' , [UsersController::class , 'all'])->name('admin.users.all');
        Route::get('create' , [UsersController::class , 'create'])->name('admin.users.create');
        Route::post('' , [UsersController::class , 'store'])->name('admin.users.store');
        Route::get('{user_id}/edit' , [UsersController::class , 'edit'])->name('admin.users.edit');
        Route::put('{user_id}/update' , [UsersController::class , 'update'])->name('admin.users.update');
        Route::delete('{user_id}/delete' , [UsersController::class , 'delete'])->name('admin.users.delete');
    });

    Route::prefix('orders')->group(function()
    {
        Route::get('' , [OrdersController::class , 'index'])->name('admin.orders.index');
    });

    Route::prefix('payments')->group(function()
    {
        Route::get('' , [PaymentsController::class , 'index'])->name('admin.payments.index');
    });

});

Route::prefix('payment')->group(function (){
    Route::post('pay', [PaymentController::class, 'pay'])->name('payment.pay');
    Route::post('callback', [PaymentController::class, 'callback'])->name('payment.callback');
});


Route::get('/login', function () {
    return view('authentication.login');
})->name('login');

Route::get('/register', function () {
    return view('authentication.register');
})->name('register');

Route::post('login', [AuthenticationController::class, 'login'])->name('login');

Route::post('register', [AuthenticationController::class, 'register'])->name('register');

Route::get('logout', [AuthenticationController::class, 'logout'])->name('logout');

Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');

Route::get('/read', function () {
    $user = \App\Models\User::find(1);

    foreach($user->product as $product)
    {
        echo $product;
    }
});