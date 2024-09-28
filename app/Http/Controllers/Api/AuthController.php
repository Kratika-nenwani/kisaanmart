<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password = bcrypt($request->password);
        $user->save();

        return response()->json(['message' => 'Register Successful', 'user'=> $user], 200);
    }
    public function login(Request $request)
    {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
        ];

        if (Auth::guard('web')->attempt($credentials)) {
            $user = Auth::user();

            // Return a JSON response if authentication is successful
            return response()->json(['user' => $user], 200);
        }

        // If authentication fails, redirect back with an error message
        return response()->json(['message' => 'Invalid credentials'], 401);
    }
}
