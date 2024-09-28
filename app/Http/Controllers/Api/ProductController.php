<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use App\Models\Product;
use Yajra\Datatables\Datatables;

class ProductController extends Controller
{
    public function add(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'section_id' => 'required|exists:sections,id',
            'brand_id' => 'required|exists:brands,id',
            'category_id' => 'required|exists:categories,id',
            'subcategory_id' => 'required|exists:sub_categories,id',
        ]);

        
        $product = new Product;
        $product->name = $request->name;
        $product->section_id = $request->section_id;
        $product->brand_id = $request->brand_id;
        $product->category_id = $request->category_id;
        $product->subcategory_id = $request->subcategory_id;

        $product->save();

        return response()->json(['message' => 'Product created successfully', 'data' => $product], 200);
    }

    public function edit(Request $request)
{
    $validatedData = $request->validate([
        'name'           => 'required|string|max:255',
        'section_id'     => 'required|exists:sections,id',
        'brand_id'       => 'required|exists:brands,id',
        'category_id'    => 'required',
        'subcategory_id' => 'required',
        'product_id'     => 'required'
    ]);

    $product = Product::findOrFail($validatedData['product_id']);
    $product->section_id = $validatedData['section_id'];
    $product->name = $validatedData['name'];
    $product->brand_id = $validatedData['brand_id'];
    $product->category_id = $validatedData['category_id'];
    $product->subcategory_id = $validatedData['subcategory_id'];  // Fix here

    $product->save();

    return response()->json(['message' => 'Product updated successfully', 'data' => $product], 200);
}

public function read(Request $request)
{
    $validatedData = $request->validate([
        'id' => 'required',
    ]);

    $product = product::find($validatedData['id']);

    return response()->json(['message' => 'product retrieved successfully', 'data' => $product], 200);
}

public function delete(Request $request)
{
    $validatedData = $request->validate([
        'id' => 'required',
    ]);

    $product = Product::findOrFail($validatedData['id']);

    $product->delete();

    return response()->json(['message' => 'Product deleted successfully'], 200);
}

public function product_by_section(Request $request)
{
    $validatedData = $request->validate([
        'section_id' => 'required',
    ]);
    $product = Product::where('section_id',$validatedData['section_id'])->get();
    return response()->json(['message' => 'product successfully retrive ', 'data' =>  $product], 200);
}
public function product_by_brands(Request $request)
{
    $validatedData = $request->validate([
        'brand_id' => 'required',
    ]);
    $product = Product::where('brand_id',$validatedData['brand_id'])->get();
    return response()->json(['message' => 'product successfully retrive ', 'data' =>  $product], 200);
}
public function product_by_category(Request $request)
{
    $validatedData = $request->validate([
        'category_id' => 'required',
    ]);
    $product = Product::where('category_id',$validatedData['category_id'])->get();
    return response()->json(['message' => 'product successfully retrive ', 'data' =>  $product], 200);
}
public function product_by_subcategory(Request $request)
{
    $validatedData = $request->validate([
        'subcategory_id' => 'required',
    ]);
    $product = Product::where('subcategory_id',$validatedData['subcategory_id'])->get();
    return response()->json(['message' => 'product successfully retrive ', 'data' =>  $product], 200);
}


}
