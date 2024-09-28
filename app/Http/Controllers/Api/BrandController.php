<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use Yajra\Datatables\Datatables;

class BrandController extends Controller
{
    public function add(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'section_id' => 'required|exists:sections,id',
            'logo' => 'required', 
        ]);

        $brand = new Brand;
        $brand->name = $request->input('name');
        $brand->section_id = $request->input('section_id');
        $brand->logo = $request->input('logo');
        
      
        $brand->save();

        return response()->json(['message' => 'Brand created successfully', 'data' => $brand], 201);
    }

    public function edit(Request $request)
{
    $validatedData = $request->validate([
        'section_id' => 'required|exists:sections,id',
        'name'       => 'required|string|max:255',
        'logo'       => 'required', 
        'brand_id'   => 'required'
    ]);

    $brand = Brand::findOrFail( $validatedData['brand_id']);
    $brand->section_id = $validatedData['section_id'];
    $brand->name = $validatedData['name'];
    $brand->logo = $validatedData['logo'];

    $brand->save();

    return response()->json(['message' => 'Brand updated successfully', 'data' => $brand], 200);
}

public function brands(){
    $brands = Brand::all();
    return response()->json(['message' => 'Brands fetched successfully', 'data'=> $brands], 200);
}

public function read(Request $request)
{
    $validatedData = $request->validate([
        'id' => 'required',
    ]);

    $brand = Brand::find($validatedData['id']);

    return response()->json(['message' => 'Brand retrieved successfully', 'data' => $brand], 200);
}

public function delete(Request $request)
{
    
    $validatedData = $request->validate([
        'id' => 'required',
    ]);

    $brand = Brand::findOrFail($validatedData['id']);
    $brand->delete();

    return response()->json(['message' => 'Brand deleted successfully'], 200);
}
public function brands_by_section(Request $request)
{
    $validatedData = $request->validate([
        'section_id' => 'required',
    ]);
    
    $brand = Brand::where('section_id',$validatedData['section_id'])->get();
    return response()->json(['message' => 'brand successfully retrive ', 'data' =>  $brand], 200);

}


}
