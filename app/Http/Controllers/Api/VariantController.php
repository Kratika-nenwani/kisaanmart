<?php

namespace App\Http\Controllers\Api;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Variant;
use App\Models\Cart;
use App\Models\Wishlist;
use App\Models\User;
use Yajra\Datatables\Datatables;

class VariantController extends Controller
{
    public function add(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'section_id' => 'required|exists:sections,id',
            'brand_id' => 'required|exists:brands,id',
            'category_id' => 'required|exists:categories,id',
            'subcategory_id' => 'required|exists:sub_categories,id',
            'product_id' => 'required|exists:products,id',
            'price' => 'required',
            'image' => 'required',
        ]);

       
        $variant = new Variant;
        $variant->name = $request->name;
        $variant->section_id = $request->section_id;
        $variant->brand_id = $request->brand_id;
        $variant->category_id = $request->category_id;
        $variant->subcategory_id = $request->subcategory_id;
        $variant->product_id = $request->product_id;
        $variant->price = $request->price;
        $variant->image = $request->image;

        if($request->description){
            $variant->description = $request->description;

        }
        if($request->rating){
            $variant->rating = $request->rating;
        }
        
        $variant->save();

        return response()->json(['message' => 'Variant created successfully', 'data' => $variant], 200);
    }

    public function edit(Request $request)
    {
        $validatedData = $request->validate([
            'name'           => 'required|string|max:255',
            'section_id'     => 'required|exists:sections,id',
            'brand_id'       => 'required|exists:brands,id',
            'category_id'    => 'required',
            'subcategory_id' => 'required',
            'product_id'     => 'required',
            'variant_id'     => 'required',
            'price'          => 'required',
            'image'          => 'required',
            'description'   =>  'required',
            'rating'        =>  'required'
        ]);
    
        $variant = Variant::findOrFail($validatedData['variant_id']);
        $variant->section_id = $validatedData['section_id'];
        $variant->name = $validatedData['name'];
        $variant->brand_id = $validatedData['brand_id'];
        $variant->category_id = $validatedData['category_id'];
        $variant->subcategory_id = $validatedData['subcategory_id'];  // Fix here
        $variant->product_id = $validatedData['product_id'];
        $variant->price = $validatedData['price'];
        $variant->image = $validatedData['image'];
        $variant->description = $validatedData['description'];

    
        $variant->save();
    
        return response()->json(['message' => 'Variant updated successfully', 'data' => $variant], 200);
    }
    
    public function read($id)
    {
        $variant = variant::find($id);

        return response()->json(['message' => 'variant retrieved successfully', 'data' => $variant], 200);
    }
    
    public function featured(){
        $featured = Variant::where('type', 'Featured')->get();
        return response()->json(['data' => $featured], 200);
    }

    public function delete(Request $request)
    {
        $validatedData = $request->validate([
            'id' => 'required',
        ]);
    
        $variant = variant::findOrFail($validatedData['id']);
    
        $variant->delete();
    
        return response()->json(['message' => 'variant deleted successfully'], 200);
    }
    
    public function variant_by_section($id)
    {
        $variant = Variant::where('section_id',$id)->get();
        return response()->json(['message' => 'variant successfully retrive ', 'data' => $variant], 200);

    }
    
    public function variant_by_brands(Request $request)
    {
        $validatedData = $request->validate([
            'brand_id' => 'required',
        ]);
        $variant = Variant::where('brand_id',$validatedData['brand_id'])->get();
        return response()->json(['message' => 'variant successfully retrive ', 'data' => $variant], 200);
    }

    public function variant_by_category(Request $request)
    {
        $validatedData = $request->validate([
            'category_id' => 'required',
        ]);
        $variant = Variant::where('category_id',$validatedData['category_id'])->get();
        return response()->json(['message' => 'variant successfully retrive ', 'data' => $variant], 200);
    }

    public function variant_by_subcategory(Request $request)
    {
        $validatedData = $request->validate([
            'subcategory_id' => 'required',
        ]);
        $variant = Variant::where('subcategory_id',$validatedData['subcategory_id'])->get();
        return response()->json(['message' => 'variant successfully retrive ', 'data' => $variant], 200);
    }

    public function variant_by_product(Request $request)
    {
        $validatedData = $request->validate([
            'product_id' => 'required',
        ]);
        $variant = Variant::where('product_id',$validatedData['product_id'])->get();
        return response()->json(['message' => 'variant successfully retrive ', 'data' => $variant], 200);
    }

    public function search($name = null){
        if(!$name){
            return response()->json(['message' => 'Empty', 'data'=>[]], 200);
        }
        $data = Variant::where('name', 'LIKE', "%".$name."%")->orWhere('description', 'LIKE', "%".$name."%")->get();
        if($data->count() > 0){
            return response()->json(['message'=>'Related Products', 'data'=>$data], 200);
        }else{
            return response()->json(['message' => 'Not Found', 'data'=>$data], 200);
        }
    }
    
    public function add_to_cart(Request $request, $id)
    {   
        $user = User::find($request->user_id);
        $variant = Variant::find($id);
        $cart = Cart::where('user_id', $user->id)->where('variant_id', $id)->first();
        if($cart){
            $cart->quantity += 1;
            $cart->total = $cart->total + $variant->disprice;
            $cart->mrp_total = $cart->mrp_total + $variant->mrp;
            $cart->save();
        }else{
            $cart = new Cart();
            $cart->user_id = $user->id;
            $cart->variant_id = $id;
            $cart->name = $variant->name;
            $cart->image = $variant->image[0];
            $cart->quantity = 1;
            $cart->price = $variant->price;
            $cart->disprice= $variant->disprice;
            $cart->total = $variant->disprice;
            $cart->mrp = $variant->mrp;
            $cart->mrp_total = $variant->mrp;
            $cart->save();
        }
        return response()->json([
            'message' => 'Product added to cart successfully',
            'cart' => $cart
        ], 200);
    }
    
    public function plus($id){
        $cart = Cart::find($id);
        if($cart->price){
            $price = $cart->price;
            $mrp = $cart->mrp;
        }
        $cart->quantity += 1;
        $cart->total = $cart->total + $price;
        $cart->mrp_total = $cart->mrp_total + $mrp;
        $cart->save();
        return response()->json([
            'message' => 'Product added to cart successfully',
            'cart' => $cart
        ], 200);
    }
    
    public function minus($id){
        $cart = Cart::find($id);
        if($cart->quantity == 1){
            $cart->delete();
        }else{
            if($cart != null){
                $price = $cart->price;
                $mrp = $cart->mrp;
                $cart->quantity -= 1;
                $cart->total = $cart->total - $price;
                $cart->mrp_total = $cart->mrp_total - $mrp;
                $cart->save();
            }
        }
        return response()->json([
            'message' => 'Product removed from the cart successfully',
            'cart' => $cart
        ], 200);
    }
    
    public function cart($id)
    {
        $user = User::find($id);
        $cart = Cart::where('user_id', $user->id)->get();
        if($cart->isEmpty()) {
            return response()->json([
                'total' => 0,
                'cart' => $cart
            ], 200);
        }
        else
        {
            $ctotal = $cart->sum('total');
            $cmrptotal = $cart->sum('mrp_total');
            $responseData = [
                'total' => $ctotal,
                'cart' => $cart,
                'mrptotal' => $cmrptotal,
                'discount' => $cmrptotal - $ctotal
                
            ];
            
            return response()->json($responseData, 200);
        }
    }
    
    public function delete_from_cart($id){
        $data=Cart::find($id);
        if ($data) {
            $data->delete();
            return response()->json(['message' => 'Cart deleted successfully'], 200);
        } else {
            return response()->json(['message' => 'Cart not found'], 200);
        }
    }
    
    public function add_to_wishlist(Request $request, $id)
    {   
        $user = User::find($request->user_id);
        $variant = Variant::find($id);
        $wishlist = Wishlist::where('user_id', $user->id)->where('variant_id', $id)->first();
        if($wishlist){
            return response()->json([
                'message' => 'Product already exist in wishlist',
                'wishlist' => $wishlist
                ]);
        }else{
            $wishlist = new Wishlist();
            $wishlist->user_id = $user->id;
            $wishlist->variant_id = $id;
            $wishlist->name = $variant->name;
            $wishlist->image = $variant->image[0];
            $wishlist->price = $variant->price;
            $wishlist->save();
            return response()->json([
                'message' => 'Product added to wishlist successfully',
                'wishlist' => $wishlist
            ], 200);
        }
    }
    public function wishlist($id)
    {
        $user = User::find($id);
        $wishlist = Wishlist::where('user_id', $user->id)->get();
        if($wishlist->isEmpty()) {
            return response()->json([
                'wishlist' => $wishlist
            ], 200);
        }
        else
        {
            $responseData = [
                'wishlist' => $wishlist,
            ];
            
            return response()->json($responseData, 200);
        }
    }
    
    public function delete_from_wishlist($id){
        $data=Wishlist::find($id);
        if ($data) {
            $data->delete();
            return response()->json(['message' => 'Wishlist deleted successfully'], 200);
        } else {
            return response()->json(['message' => 'Wishlist not found'], 200);
        }
    }


}
