<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Subcategory;
use Yajra\Datatables\Datatables;

class Subcategorycontroller extends Controller
{
    public function add(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'section_id' => 'required|exists:sections,id',
            'brand_id' => 'required|exists:brands,id',
            'category_id' => 'required|exists:categories,id',
        ]);

       
        $subcategory = new Subcategory;
        $subcategory->name = $request->input('name');
        $subcategory->section_id = $request->input('section_id');
        $subcategory->brand_id = $request->input('brand_id');
        $subcategory->category_id = $request->input('category_id');

        $subcategory->save();

        return response()->json(['message' => 'Subcategory created successfully', 'data' => $subcategory], 201);
    }

    public function edit(Request $request)
{
    $validatedData = $request->validate([
        'name'         => 'required|string|max:255',
        'section_id'   => 'required|exists:sections,id',
        'brand_id'     => 'required|exists:brands,id',
        'category_id'  => 'required',
        'subcategory_id' => 'required'
    ]);

    $subcategory = Subcategory::findOrFail($validatedData['subcategory_id']);
    $subcategory->name = $validatedData['name'];
    $subcategory->section_id = $validatedData['section_id'];
    $subcategory->brand_id = $validatedData['brand_id'];
    $subcategory->category_id = $validatedData['category_id'];

    $subcategory->save();

    return response()->json(['message' => 'SubCategory updated successfully', 'data' => $subcategory], 200);
}

public function read(Request $request)
{
    $validatedData = $request->validate([
        'id' => 'required',
    ]);

    $subcategory = Subcategory::find($validatedData['id']);

    return response()->json(['message' => 'subcategory retrieved successfully', 'data' => $subcategory], 200);
}

public function delete(Request $request)
{
    $validatedData = $request->validate([
        'id' => 'required',
    ]);

    $subcategory  = Subcategory::findOrFail($validatedData['id']);

    $subcategory ->delete();

    return response()->json(['message' => 'Subcategory deleted successfully'], 200);
}
public function subcategory_by_section(Request $request)
{
    $validatedData = $request->validate([
        'section_id' => 'required',
    ]);
    $subcategory = Subcategory::where('section_id',$validatedData['section_id'])->get();
    return response()->json(['message' => 'subcategory successfully retrive ', 'data' =>   $subcategory], 200);
}
public function subcategory_by_brands(Request $request)
{
    $validatedData = $request->validate([
        'brand_id' => 'required',
    ]);
    $subcategory = Subcategory::where('section_id',$validatedData['brand_id'])->get();
    return response()->json(['message' => 'subcategory successfully retrive ', 'data' =>   $subcategory], 200);
}
public function subcategory_by_category(Request $request)
{
    $validatedData = $request->validate([
        'category_id' => 'required',
    ]);
    $subcategory = Subcategory::where('category_id',$validatedData['category_id'])->get();
    return response()->json(['message' => 'subcategory successfully retrive ', 'data' =>   $subcategory], 200);
}



}