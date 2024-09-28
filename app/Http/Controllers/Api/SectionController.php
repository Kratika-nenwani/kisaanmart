<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Section;
use Yajra\Datatables\Datatables as Datatables;

class SectionController extends Controller
{
    
    public function section(){
        $section = Section::all();
        return response()->json(['message' => 'Sections retrieved successfully', 'data' => $section], 200);
        
    }
    public function add(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $section = Section::create($validatedData);

        return response()->json(['message' => 'Section added successfully', 'data' => $section], 200);
    }

    public function edit(Request $request)
    {
        $validatedData = $request->validate([
            'id'   => 'required|exists:sections,id',
            'name' => 'required|string|max:255',
        ]);

        $section = Section::findOrFail($validatedData['id']);
        $section->update(['name' => $validatedData['name']]);

        return response()->json(['message' => 'Section updated successfully', 'data' => $section], 200);
    }

    public function read(Request $request)
    {
        $validatedData = $request->validate([
            'id' => 'required|exists:sections,id',
        ]);

    

        $section = Section::find($validatedData['id']);

        return response()->json(['message' => 'Section retrieved successfully', 'data' => $section], 200);
    }

    public function delete(Request $request)
    {
        $validatedData = $request->validate([
            'id' => 'required',
        ]);

        $section = Section::findOrFail($validatedData['id']);
        $section->delete();

        return response()->json(['message' => 'Section deleted successfully'], 200);
    }

    
}
