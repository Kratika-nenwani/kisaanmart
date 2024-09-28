<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Address;
use App\Models\User;

class AddressController extends Controller
{
    public function getaddressdetails($id)
    {
        $data = Address::where('user_id', $id)->get();
        return response()->json(['address' => $data]);
    }

    public function saveaddressdetails(Request $request)
    {
        
        if($request->id){
            $data = Address::find($request->id);
        }
        else{
            $data = new Address;
        }
        $user = User::find($request->user_id);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 200);
        }
        
        $data->user_id = $user->id;
        $data->address = $request->address;
        $data->phone = $request->phone;
        $data->type = $request->type;
        $data->save();
        return response()->json([
            'message' => 'Address saved successfully',
            'address details' => $data
        ], 200);
    }
    
    public function deleteaddress($id){
        $add = Address::find($id);
        $add->delete();
        return response()->json(['message'=> 'Address deleted successfully!'], 200);
    }
}
