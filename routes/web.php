<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Auth;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('index');
})->name('index');
Route::get('/admin', function (){
    return view('welcome');
})->name('admin');
Route::get('/terms', function (){
    return view('terms');
})->name('terms');
Route::get('/privacy', function (){
    return view('privacy');
})->name('privacy');
Route::get('/refund', function (){
    return view('refund');
})->name('refund');


Auth::routes();


Route::get('/home', [HomeController::class, 'index'])->name('home');
Route::get('/admin-manage-section', [HomeController::class, 'admin_manage_section'])->name('admin-manage-section');
Route::get('/admin-manage-brand', [HomeController::class, 'admin_manage_brand'])->name('admin-manage-brand');
Route::get('/admin-manage-category', [HomeController::class, 'admin_manage_category'])->name('admin-manage-category');
Route::get('/admin-manage-subcategory', [HomeController::class, 'admin_manage_subcategory'])->name('admin-manage-subcategory');
Route::get('/admin-manage-product', [HomeController::class, 'admin_manage_product'])->name('admin-manage-product');
Route::get('/admin-manage-variant', [HomeController::class, 'admin_manage_variant'])->name('admin-manage-variant');
Route::get('/admin-manage-banner', [HomeController::class, 'admin_manage_banner'])->name('admin-manage-banner');


Route::get('/brand-by-section/{id}', [HomeController::class, 'brand_by_section'])->name('brand-by-section');
Route::get('/category-by-brand/{id}', [HomeController::class, 'category_by_brand'])->name('category-by-brand');
Route::get('/subcategory-by-category/{id}', [HomeController::class, 'subcategory_by_category'])->name('subcategory-by-category');
Route::get('/product-by-subcategory/{id}', [HomeController::class, 'product_by_subcategory'])->name('product-by-subcategory');
Route::get('/variant-by-product/{id}', [HomeController::class, 'variant_by_product'])->name('variant-by-product');

Route::post('/savesection', [HomeController::class, 'savesection'])->name('savesection');
Route::post('/savebrand', [HomeController::class, 'savebrand'])->name('savebrand');
Route::post('/savecategory', [HomeController::class, 'savecategory'])->name('savecategory');
Route::post('/savesubcategory', [HomeController::class, 'savesubcategory'])->name('savesubcategory');
Route::post('/saveproduct', [HomeController::class, 'saveproduct'])->name('saveproduct');
Route::post('/savevariant', [HomeController::class, 'savevariant'])->name('savevariant');
Route::post('/savebanner', [HomeController::class, 'savebanner'])->name('savebanner');
Route::post('brand-discount/{id}', [HomeController::class, 'brand_discount'])->name('brand-discount');

Route::get('/deleteproduct', [HomeController::class, 'deleteproduct'])->name('deleteproduct');
Route::get('/deletevariant', [HomeController::class, 'deletevariant'])->name('deletevariant');
Route::get('/deletesubcategory', [HomeController::class, 'deletesubcategory'])->name('deletesubcategory');
Route::get('/deletecategory', [HomeController::class, 'deletecategory'])->name('deletecategory');
Route::get('/deletebrand', [HomeController::class, 'deletebrand'])->name('deletebrand');
Route::get('/deletesection', [HomeController::class, 'deletesection'])->name('deletesection');
Route::get('/deletebanner', [HomeController::class, 'deletebanner'])->name('deletebanner');
Route::get('/changebannerType', [HomeController::class, 'changebannerType'])->name('changebannerType');

Route::post('/editvariant/{id}', [HomeController::class, 'editvariant'])->name('editvariant');
Route::post('/editproduct/{id}', [HomeController::class, 'editproduct'])->name('editproduct');
Route::post('/editcategory/{id}', [HomeController::class, 'editcategory'])->name('editcategory');
Route::post('/editsubcategory/{id}', [HomeController::class, 'editsubcategory'])->name('editsubcategory');
Route::post('/editbrand/{id}', [HomeController::class, 'editbrand'])->name('editbrand');
Route::post('/editsection/{id}', [HomeController::class, 'editsection'])->name('editsection');

Route::get('/admin-manage-orders', [HomeController::class, 'admin_manage_orders'])->name('admin-manage-orders');
Route::get('/delivered-orders', [HomeController::class, 'delivered_orders'])->name('delivered-orders');
Route::get('/accept/{id}', [HomeController::class, 'accept'])->name('accept');
Route::get('/reject/{id}', [HomeController::class, 'reject'])->name('reject');
Route::get('/delivered/{id}', [HomeController::class, 'delivered'])->name('delivered');
Route::get('order-details/{id}', [HomeController::class, 'order_details'])->name('order-details');

