<?php

use Illuminate\Http\Request;
use App\Http\Controllers\Api\AuthController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\SectionController;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\SubcategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\VariantController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\AddressController;
use App\Http\Controllers\Api\BannerController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::get('/sections', [SectionController::class, 'section']);
Route::post('/add-section', [SectionController::class, 'add']);
Route::put('/edit-section', [SectionController::class, 'edit']);
Route::get('/read-section', [SectionController::class, 'read']);
Route::post('/delete-section', [SectionController::class, 'delete']);
Route::post('/section_by_brands', [SectionController::class, 'section_by_brands']);
Route::post('/section_by_category', [SectionController::class, 'section_by_category']);
Route::post('/section_by_subcategory', [SectionController::class, 'section_by_subcategory']);
Route::post('/section_by_product', [SectionController::class, 'section_by_product']);
Route::post('/section_by_variant', [SectionController::class, 'section_by_variant']);

Route::get('brands', [BrandController::class, 'brands']);
Route::post('/add-brands', [BrandController::class, 'add']);
Route::put('/edit-brands', [BrandController::class, 'edit']);
Route::get('/read-brands', [BrandController::class, 'read']);
Route::post('/delete-brands', [BrandController::class, 'delete']);
Route::post('/brands_by_section', [BrandController::class, 'brands_by_section']);
Route::post('/brands_by_category', [BrandController::class, 'brands_by_category']);
Route::post('/brands_by_subcategory', [BrandController::class, 'brands_by_subcategory']);
Route::post('/brands_by_product', [BrandController::class, 'brands_by_product']);
Route::post('/brands_by_variant', [BrandController::class, 'brands_by_variant']);


Route::post('/add-category', [CategoryController::class, 'add']);
Route::put('/edit-category', [CategoryController::class, 'edit']);
Route::get('/read-category', [CategoryController::class, 'read']);
Route::post('/delete-category', [CategoryController::class, 'delete']);
Route::post('/category_by_section', [CategoryController::class, 'category_by_section']);
Route::post('/category_by_brands', [CategoryController::class, 'category_by_brands']);
Route::post('/category_by_subcategory', [CategoryController::class, 'category_by_subcategory']);
Route::post('/category_by_product', [CategoryController::class, 'category_by_product']);
Route::post('/category_by_variant', [CategoryController::class, 'category_by_variant']);


Route::post('/add-subcategory', [SubcategoryController::class, 'add']);
Route::put('/edit-subcategory', [SubcategoryController::class, 'edit']);
Route::get('/read-subcategory', [SubcategoryController::class, 'read']);
Route::post('/delete-subcategory', [SubcategoryController::class, 'delete']);
Route::post('/subcategory_by_section', [SubcategoryController::class, 'subcategory_by_section']);
Route::post('/subcategory_by_brands', [SubcategoryController::class, 'subcategory_by_brands']);
Route::post('/subcategory_by_category', [SubcategoryController::class, 'subcategory_by_category']);
Route::post('/subcategory_by_product', [SubcategoryController::class, 'subcategory_by_product']);
Route::post('/subcategory_by_variant', [SubcategoryController::class, 'subcategory_by_variant']);


Route::post('/add-product', [ProductController::class, 'add']);
Route::put('/edit-product', [ProductController::class, 'edit']);
Route::get('/read-product', [ProductController::class, 'read']);
Route::post('/delete-product', [ProductController::class, 'delete']);
Route::post('/product_by_section', [ProductController::class, 'product_by_section']);
Route::post('/product_by_brands', [ProductController::class, 'product_by_brands']);
Route::post('/product_by_category', [ProductController::class, 'product_by_category']);
Route::post('/product_by_subcategory', [ProductController::class, 'product_by_subcategory']);
Route::post('/product_by_variant', [ProductController::class, 'product_by_variant']);


Route::post('/add-variant', [VariantController::class, 'add']);
Route::put('/edit-variant', [VariantController::class, 'edit']);
Route::get('/read-variant/{id}', [VariantController::class, 'read']);
Route::post('/delete-variant', [VariantController::class, 'delete']);
Route::get('/variant_by_section/{id}', [VariantController::class, 'variant_by_section']);
Route::post('/variant_by_brands', [VariantController::class, 'variant_by_brands']);
Route::post('/variant_by_category', [VariantController::class, 'variant_by_category']);
Route::post('/variant_by_subcategory', [VariantController::class, 'variant_by_subcategory']);
Route::post('/variant_by_product', [VariantController::class, 'variant_by_product']);
Route::get('/featured', [VariantController::class, 'featured']);

Route::get('/search/{name?}', [VariantController::class, 'search']);
Route::post('/add-to-cart/{id}', [VariantController::class, 'add_to_cart']);
Route::post('/plus/{id}', [VariantController::class, 'plus']);
Route::post('/minus/{id}', [VariantController::class, 'minus']);
Route::get('/cart/{id}', [VariantController::class, 'cart']);
Route::post('/delete-from-cart/{id}', [VariantController::class, 'delete_from_cart']);

Route::post('/add-to-wishlist/{id}', [VariantController::class, 'add_to_wishlist']);
Route::get('/wishlist/{id}', [VariantController::class, 'wishlist']);
Route::post('/delete-from-wishlist/{id}', [VariantController::class, 'delete_from_wishlist']);

Route::post('/cod', [OrderController::class, 'cash_on_delivery']);
Route::get('/pending-order/{id}', [OrderController::class, 'pending_orders']);
Route::get('/delivered-order/{id}', [OrderController::class, 'delivered_orders']);
Route::get('/order-details/{id}', [OrderController::class, 'order_details']);


Route::post('/phonepe', [OrderController::class, 'phonepe'])->name('phonepe');
Route::any('/phonepe-response/{user_id}/{address}', [OrderController::class,'phonepe_response'])->name('phonepe-response');
Route::get('/success', function(){
    return view('success');
})->name('success');
Route::get('/failed', function(){
    return view('failed');
})->name('failed');

Route::get('/getaddressdetails/{id}',[AddressController::class,'getaddressdetails']);
Route::post('/saveaddressdetails',[AddressController::class,'saveaddressdetails']);
Route::post('deleteaddress/{id}', [AddressController::class, 'deleteaddress']);

Route::get('/banner', [BannerController::class, 'index']);
