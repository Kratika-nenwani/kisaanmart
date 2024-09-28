<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Yajra\Datatables\Datatables;


class CategoryController extends Controller
{
    public function add(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'section_id' => 'required|exists:sections,id',
            'brand_id' => 'required|exists:brands,id',
        ]);

        $category = Category::create([
            'name' => $request->input('name'),
            'section_id' => $request->input('section_id'),
            'brand_id' => $request->input('brand_id'),
        ]);

        return response()->json(['message' => 'Category created successfully', 'data' => $category], 201);
    }

    public function edit(Request $request)
    {
       
        $validatedData = $request->validate([
            'name'       => 'required|string|max:255',
            'section_id' => 'required|exists:sections,id',
            'brand_id'   => 'required|exists:brands,id',
            'category_id' => 'required'
        ]);

        $category = Category::findOrFail($validatedData['category_id']);
        $category->section_id = $validatedData['section_id'];
        $category->name = $validatedData['name'];
        $category->brand_id = $validatedData['brand_id'];
        
        $category->save();

        return response()->json(['message' => 'Category updated successfully', 'data' => $category], 200);
    }

    public function read(Request $request)
{
    $validatedData = $request->validate([
        'id' => 'required',
    ]);

    $category = category::find($validatedData['id']);

    return response()->json(['message' => 'category retrieved successfully', 'data' => $category], 200);
}

public function delete(Request $request)
{
    $validatedData = $request->validate([
        'id' => 'required',
    ]);

    $category = Category::findOrFail($validatedData['id']);

    $category->delete();

    return response()->json(['message' => 'category deleted successfully'], 200);
}
public function category_by_section(Request $request)
{
    $validatedData = $request->validate([
        'section_id' => 'required',
    ]);
    $category = Category::where('section_id',$validatedData['section_id'])->get();
    return response()->json(['message' => 'category successfully retrive ', 'data' =>  $category], 200);
}
public function category_by_brand(Request $request)
{
    $validatedData = $request->validate([
        'brand_id' => 'required',
    ]);
    $category = Category::where('brand_id',$validatedData['brand_id'])->get();
    return response()->json(['message' => 'category successfully retrive ', 'data' =>  $category], 200);
}


}
