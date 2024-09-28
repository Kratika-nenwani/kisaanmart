<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;


class BannerController extends Controller
{
    public function index(){
        $data = Banner::where('type', 'featured')->pluck('image');
        return response()->json([
            'banner' => $data,
        ], 200);
    }

}
