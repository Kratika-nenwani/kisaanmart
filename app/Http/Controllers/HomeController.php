<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Section;
use App\Models\Variant;
use App\Models\SubCategory;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Banner;
use App\Models\Order;
use App\Models\User;
use DateTime;
use Yajra\Datatables\Datatables as Datatables;
use Illuminate\Support\Facades\Log;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('admin.index');
    }
    public function admin_manage_section(Request $request)
    {
        $data = Section::all();
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('image', function ($row){
                    $btn = '<img src="' . asset('Section Image/' . $row->image) . '" style="width:100px; height:auto;">';
                    return $btn;
                })
                ->addColumn('action', function ($row) {
                    $btn = ' &nbsp;&nbsp;<a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn .= ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->addColumn('action1', function ($row) {

                    $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '"  href="' . route('brand-by-section', ['id' => $row->id]) . '">View Brands</a>';
                    return $btn;
                })
                ->rawColumns(['image', 'action', 'action1'])
                ->make(true);
        }
        return view('admin.manage-section', compact('data'));
    }
    public function admin_manage_brand(Request $request)
    {
        $sections = Section::all();
        $data = Brand::all();
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('logo', function($row){
                    $btn = '<img src="' . asset('BrandLogos/' . $row->logo) . '" style="width:100px; height:auto;">';
                    return $btn;
                })
                ->addColumn('section_id', function ($row){
                    $section = Section::find($row->section_id);
                    return $section ? $section->name : 'N/A'; 
                })
                ->addColumn('action', function ($row) {
                    $btn = '&nbsp;&nbsp; <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="discount">📢️</a>';
                    return $btn;
                })
                ->addColumn('action1', function ($row) {
                    $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '" href="' . route('category-by-brand', ['id' => $row->id]) . '">View Categories</a>';
                    return $btn;
                })
                ->rawColumns(['logo', 'action', 'action1'])
                ->make(true);
        }
        return view('admin.manage-brand', compact('data', 'sections'));
    }

    public function admin_manage_category(Request $request)
    {
        $sections = Section::all();
        $brands = Brand::all();
        $data = Category::all();
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('section_id', function ($row){
                    $section = Section::find($row->section_id);
                    return $section ? $section->name : 'N/A'; 
                })
                ->addColumn('brand_id', function ($row){
                    $brand = Brand::find($row->brand_id);
                    return $brand ? $brand->name : 'N/A'; 
                })
                ->addColumn('action', function ($row) {
                    $btn = ' <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->addColumn('action1', function ($row) {
                    $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '" href="' . route('subcategory-by-category', ['id' => $row->id]) . '">View Subcategories</a>';
                    return $btn;
                })
                ->rawColumns(['action', 'action1'])
                ->make(true);
        }
        return view('admin.manage-category', compact('data', 'sections', 'brands'));
    }
    public function admin_manage_subcategory(Request $request)
    {
        $sections = Section::all();
        $brands = Brand::all();
        $categories = Category::all();
        $data = SubCategory::all();
        // dd($data);
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('section_id', function ($row){
                    $section = Section::find($row->section_id);
                    return $section ? $section->name : 'N/A'; 
                })
                ->addColumn('brand_id', function ($row){
                    $brand = Brand::find($row->brand_id);
                    return $brand ? $brand->name : 'N/A'; 
                })
                ->addColumn('category_id', function ($row){
                    $category = Category::find($row->category_id);
                    return $category ? $category->name : 'N/A'; 
                })
                ->addColumn('action', function ($row) {
                    $btn = ' <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->addColumn('action1', function ($row) {

                    $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '" href="' . route('product-by-subcategory', ['id' => $row->id]) . '">View Products</a>';
                    return $btn;
                })
                ->rawColumns(['action', 'action1'])
                ->make(true);
        }
        return view('admin.manage-subcategory', compact('data', 'sections', 'brands', 'categories'));
    }
    public function admin_manage_product(Request $request)
    {
        $sections = Section::all();
        $brands = Brand::all();
        $categories = Category::all();
        $subcategories = SubCategory::all();
        $data = Product::all();
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('section_id', function ($row){
                    $section = Section::find($row->section_id);
                    return $section ? $section->name : 'N/A'; 
                })
                ->addColumn('brand_id', function ($row){
                    $brand = Brand::find($row->brand_id);
                    return $brand ? $brand->name : 'N/A'; 
                })
                ->addColumn('category_id', function ($row){
                    $category = Category::find($row->category_id);
                    return $category ? $category->name : 'N/A'; 
                })
                ->addColumn('subcategory_id', function ($row){
                    $subcategory = SubCategory::find($row->subcategory_id);
                    return $subcategory ? $subcategory->name : 'N/A'; 
                })
                ->addColumn('action', function ($row) {

                    $btn = ' <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->addColumn('action1', function ($row) {
                    $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '" href="' . route('variant-by-product', ['id' => $row->id]) . '">View Variants</a>';
                    return $btn;
                })
                ->rawColumns(['action', 'action1'])
                ->make(true);
        }
        return view('admin.manage-product', compact('data', 'sections', 'brands', 'categories', 'subcategories'));
    }

    public function admin_manage_variant(Request $request)
    {
        $sections = Section::all();
        $brands = Brand::all();
        $categories = Category::all();
        $subcategories = SubCategory::all();
        $products = Product::all();
        $data = Variant::all();
        // dd($data);
        if ($request->ajax()) {
            
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('section_id', function ($row){
                    $section = Section::find($row->section_id);
                    return $section ? $section->name : 'N/A'; 
                })
                ->addColumn('brand_id', function ($row){
                    $brand = Brand::find($row->brand_id);
                    return $brand ? $brand->name : 'N/A'; 
                })
                ->addColumn('category_id', function ($row){
                    $category = Category::find($row->category_id);
                    return $category ? $category->name : 'N/A'; 
                })
                ->addColumn('subcategory_id', function ($row){
                    $subcategory = SubCategory::find($row->subcategory_id);
                    return $subcategory ? $subcategory->name : 'N/A'; 
                })
                ->addColumn('product_id', function ($row){
                    $product = Product::find($row->product_id);
                    return $product ? $product->name : 'N/A'; 
                })
                ->addColumn('price', function ($row){
                    
                    $btn = '₹ '. $row->price;
                    return $btn;
                })
                ->addColumn('image', function ($row){
                    $image = (string) $row->image[0];
                    $btn = '<img src="' . asset('Product Image/' . $image ) . '" style="width:100px; height:auto;">';
                    return $btn;
                })
                ->addColumn('action', function ($row) {

                    $btn = ' <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->rawColumns(['image', 'action'])
                ->make(true);
                
        }
        return view('admin.manage-variant', compact('data', 'sections', 'brands', 'categories', 'subcategories', 'products'));
    }
    
    public function admin_manage_banner(Request $request)
    {

         $data = Banner::all();
        //  dd($data);
         if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                
                ->addColumn('image', function ($row){
                    $image = (string) $row->image;
                    $btn = '<img src="' . asset('Banner Image/' . $image ) . '" style="width:100px; height:auto;">';
                    return $btn;
                })
                ->addColumn('action', function ($row) {

                    $btn = ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->addColumn('action2', function ($row) {

                    $btn = ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="changeType"><button style="background-image: linear-gradient(to right, #8e44ad, #9b59b6);padding: 8px 16px;border-radius: 20px 10px;
                    transition: background-color 0.3s, color 0.3s;">Change Type</button></a>';
                    return $btn;
                })
                ->rawColumns(['image', 'action','action2'])
                ->make(true);
                
        }
        return view('admin.manage-banner', compact('data'));
    
    }
    

public function brand_by_section(Request $request, $id)
{
    $section = Section::find($id);
    if (!$section) {
        abort(404); // Or handle this case differently based on your application's logic
    }

    $sections = Section::all();
    
    $data = Brand::where('section_id', $id)->get();
    
    if ($request->ajax()) {
        return Datatables::of($data)
            ->addIndexColumn()
            ->addColumn('logo', function($row){
                $btn = '<img src="' . asset('BrandLogos/' . $row->logo) . '" style="width:100px; height:auto;">';
                return $btn;
            })
            ->addColumn('section_id', function ($row){
                $section = Section::find($row->section_id);
                return $section ? $section->name : 'N/A'; 
            })
            ->addColumn('action', function ($row) {
                 $btn = '&nbsp;&nbsp; <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                 $btn .= ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                 return $btn;
             })
            ->addColumn('action1', function ($row) {
                $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '" href="' . route('category-by-brand', ['id' => $row->id]) . '">View categories</a>';
                return $btn;
            })
            ->rawColumns(['logo', 'action1','action'])
            ->make(true);
    }
    return view('admin.brand-by-section', compact('data', 'id', 'sections'));
}

   
    public function category_by_brand(Request $request, $id)
    {
        $data = Category::where('brand_id', $id)->get();
        $first = Category::where('brand_id', $id)->first();
        if($first){
        $section_id = $first->section_id;
        // dd($section_id);
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $btn = '&nbsp;&nbsp; <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->addColumn('section_id', function ($row){
                    $section = Section::find($row->section_id);
                    return $section ? $section->name : 'N/A'; 
                })
                ->addColumn('brand_id', function ($row){
                    $brand = Brand::find($row->brand_id);
                    return $brand ? $brand->name : 'N/A'; 
                })
                ->addColumn('action1', function ($row) {
                    $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '" href="' . route('subcategory-by-category', ['id' => $row->id]) . '">View Subcategories</a>';
                    return $btn;
                })
                ->rawColumns(['action1','action'])
                ->make(true);
        }
        return view('admin.category-by-brand', compact('data', 'id', 'section_id'));
    }
    return redirect()->route("admin-manage-brand");
                }
    public function subcategory_by_category(Request $request, $id)
    {
        $data = Subcategory::where('category_id', $id)->get();
        $first = SubCategory::where('category_id', $id)->first();
        if($first){
        $brand_id = $first->brand_id;
        $section_id = $first->section_id;
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $btn = '&nbsp;&nbsp; <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->addColumn('section_id', function ($row){
                    $section = Section::find($row->section_id);
                    return $section ? $section->name : 'N/A'; 
                })
                ->addColumn('brand_id', function ($row){
                    $brand = Brand::find($row->brand_id);
                    return $brand ? $brand->name : 'N/A'; 
                })
                ->addColumn('category_id', function ($row){
                    $category = Category::find($row->category_id);
                    return $category ? $category->name : 'N/A'; 
                })
                ->addColumn('action1', function ($row) {
                    $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '" href="' . route('product-by-subcategory', ['id' => $row->id]) . '">View Product</a>';
                    return $btn;
                })
                ->rawColumns(['action1','action'])
                ->make(true);
        }
        return view('admin.subcategory-by-category', compact('data','brand_id', 'section_id', 'id'));
    }
    return redirect()->route("admin-manage-category");
                }
    
    public function product_by_subcategory(Request $request, $id)
    {
        $data = Product::where('subcategory_id', $id)->get();
        $first = Product::where('subcategory_id', $id)->first();
        
        if($first){
            $category_id= $first->category_id;
        $brand_id = $first->brand_id;
        $section_id = $first->section_id;
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $btn = '&nbsp;&nbsp; <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                    $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                    return $btn;
                })
                ->addColumn('section_id', function ($row){
                    $section = Section::find($row->section_id);
                    return $section ? $section->name : 'N/A'; 
                })
                ->addColumn('brand_id', function ($row){
                    $brand = Brand::find($row->brand_id);
                    return $brand ? $brand->name : 'N/A'; 
                })
                ->addColumn('category_id', function ($row){
                    $category = Category::find($row->category_id);
                    return $category ? $category->name : 'N/A'; 
                })
                ->addColumn('subcategory_id', function ($row){
                    $subcategory = SubCategory::find($row->subcategory_id);
                    return $subcategory ? $subcategory->name : 'N/A'; 
                })
                ->addColumn('action1', function ($row) {
                    $btn = '<a class="btn btn-info btn-fw btn-rounded" data-id="' . $row->id . '" href="' . route('variant-by-product', ['id' => $row->id]) . '">View Variant</a>';
                    return $btn;
                })
                ->rawColumns(['action1','action'])
                ->make(true);
        }
        return view('admin.product-by-subcategory', compact('data','section_id','category_id','brand_id', 'id'));
    }
    return redirect()->route("admin-manage-subcategory");
                }
    public function variant_by_product(Request $request, $id)
    {
        $data = Variant::where('product_id', $id)->get();
        $first = Variant::where('product_id', $id)->first();
        // dd($first);
        if($first){

            $category_id= $first->category_id;
            $subcategory_id= $first->subcategory_id;
            $brand_id = $first->brand_id;
            $section_id = $first->section_id;
            if ($request->ajax()) {
                return Datatables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action', function ($row) {
                        $btn = '&nbsp;&nbsp; <a data-bs-toggle="modal" style="text-decoration:none;" href="#editModal' . $row->id . '">✏️</a>';
                        $btn = $btn . ' &nbsp;&nbsp;<a href="javascript:void(0);" style="text-decoration:none;" id="' . $row->id . '" class="delete">🗑️</a>';
                        return $btn;
                    })
                    ->addColumn('section_id', function ($row){
                        $section = Section::find($row->section_id);
                        return $section ? $section->name : 'N/A'; 
                    })
                    ->addColumn('brand_id', function ($row){
                        $brand = Brand::find($row->brand_id);
                        return $brand ? $brand->name : 'N/A'; 
                    })
                    ->addColumn('category_id', function ($row){
                        $category = Category::find($row->category_id);
                        return $category ? $category->name : 'N/A'; 
                    })
                    ->addColumn('subcategory_id', function ($row){
                        $subcategory = SubCategory::find($row->subcategory_id);
                        return $subcategory ? $subcategory->name : 'N/A'; 
                    })
                    ->addColumn('product_id', function ($row){
                        $product = Product::find($row->product_id);
                        return $product ? $product->name : 'N/A'; 
                    })
                    ->addColumn('price', function ($row){
                        
                        $btn = '₹ '. $row->price;
                        return $btn;
                    })
                    ->addColumn('image', function ($row){
                        $image = (string) $row->image[0];
                        $btn = '<img src="' . asset('Product Image/' . $image ) . '" style="width:100px; height:auto;">';
                        return $btn;
                    })
                    ->rawColumns(['image','action'])
                    ->make(true);
            }
            return view('admin.variant-by-product', compact('data','subcategory_id','category_id','brand_id','section_id', 'id'));
        }
        return redirect()->route("admin-manage-product");
                }

    public function savesection(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'logo' => 'required'
        ]);
        $section = new Section;
        $section->name = $request->name;
        if($request->hasFile('logo')){
            $file = $request->file('logo');
            $ext = $file->getClientOriginalExtension();
            $filename = time() . $request->name . '.' . $ext;
            $file->move('Section Image/', $filename);
            $section->image = $filename;
        }
        
        $section->save();
        return redirect()->back()->with('success', 'Saved successfully!');
    }

    public function savebrand(Request $request)
    {
        $request->validate([
            'section_id' => 'required',
            'name' => 'required',
            'logo' => 'required'
        ]);
        $brand = new Brand;
        $brand->section_id = $request->section_id;
        $brand->name = $request->name;
        // Assuming 'logo' is the field for logo file upload
        if ($request->hasFile('logo')) {
            $file = $request->file('logo');
            $ext = $file->getClientOriginalExtension();
            $filename = time() . $request->name . '.' . $ext;
            $file->move('BrandLogos/', $filename);
            $brand->logo = $filename;
        }
        $brand->save();
        return redirect()->back()->with('success', 'Saved successfully!');
    }
    public function savecategory(Request $request)
    {
        $request->validate([
            'section_id' => 'required',
            'brand_id' => 'required',
            'name' => 'required'
        ]);
        $category = new Category;
        $category->section_id = $request->section_id;
        $category->brand_id = $request->brand_id;
        $category->name = $request->name;
        $category->save();
        return redirect()->back()->with('success', 'Saved successfully!');
    }
    public function savesubcategory(Request $request)
    {
        $request->validate([
            'section_id' => 'required',
            'brand_id' => 'required',
            'category_id' => 'required',
            'name' => 'required'
        ]);
        $subcategory = new Subcategory;
        $subcategory->section_id = $request->section_id;
        
        $subcategory->brand_id = $request->brand_id;
        $subcategory->category_id = $request->category_id;
        // dd($subcategory);
        $subcategory->name = $request->name;
        $subcategory->save();
        return redirect()->back()->with('success', 'Saved successfully!');
    }
    public function saveproduct(Request $request)
    {
        $request->validate([
            'section_id' => 'required',
            'brand_id' => 'required',
            'category_id' => 'required',
            'subcategory_id' => 'required',
            'name' => 'required'
        ]);
        
        $product = new Product;
        $product->section_id = $request->section_id;                       
        $product->brand_id =   $request->brand_id;
        $product->category_id = $request->category_id;
        $product->subcategory_id = $request->subcategory_id;
        $product->name = $request->name;
        $product->save();
        return redirect()->back()->with('success', 'Saved successfully!');
    }
    public function savevariant(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'section_id' => 'required',
            'brand_id' => 'required',
            'category_id' => 'required',
            'subcategory_id' => 'required',
            'product_id' => 'required',
            'name' => 'required',
            'mrp' => 'required',
            'price' => 'required',
            'description' => 'required',
            'image1' => 'required',
        ]);

        $variant = new Variant;
        $variant->section_id = $request->section_id;
        $variant->brand_id = $request->brand_id;
        $variant->category_id = $request->category_id;
        $variant->subcategory_id = $request->subcategory_id;
        $variant->product_id = $request->product_id;
        $variant->name = $request->name;
        $variant->price = $request->price;
        $variant->disprice = $request->price;
        $variant->mrp = $request->mrp;
        $variant->description = $request->description;
        $image = []; 
        if($request->hasFile('image1')){
            $file1 = $request->file('image1');
            $ext = $file1->getClientOriginalExtension();
            $filename1 = time() . '_1.' . $ext;
            $file1->move('Product Image/', $filename1);
            $image[] = $filename1;
        }
        if($request->hasFile('image2')){
            $file2 = $request->file('image2');
            $ext = $file2->getClientOriginalExtension();
            $filename2 = time() . '_2.' . $ext;
            $file2->move('Product Image/', $filename2);
            $image[] = $filename2;
        }
        if($request->hasFile('image3')){
            $file3 = $request->file('image3');
            $ext = $file3->getClientOriginalExtension();
            $filename3 = time() . '_3.' . $ext;
            $file3->move('Product Image/', $filename3);
            $image[] = $filename3;
        }
        if($request->hasFile('image4')){
            $file4 = $request->file('image4');
            $ext = $file4->getClientOriginalExtension();
            $filename4 = time() . '_4.' . $ext;
            $file4->move('Product Image/', $filename4);
            $image[] = $filename4;
        }
        if($request->hasFile('image5')){
            $file5 = $request->file('image5');
            $ext = $file5->getClientOriginalExtension();
            $filename5 = time() . '_5.' . $ext;
            $file5->move('Product Image/', $filename5);
            $image[] = $filename5;
        }
        $variant->image = $image;
        $variant->save();
        return redirect()->back()->with('success', 'Saved successfully!');
    }

    public function savebanner(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'type' => 'required',
            'image' => 'required'
            
        ]);
        $banner = new Banner;
        $banner->type = $request->type;
        if($request->hasFile('image')){
            $file = $request->file('image');
            $ext = $file->getClientOriginalExtension();
            $filename = time() . $request->name . '.' . $ext;
            $file->move('Banner Image/', $filename);
            $banner->image = $filename;
        }
        
        
        $banner->save();
        return redirect()->back()->with('success', 'Saved successfully!');
    }
    public function deletevariant(Request $request)
    {
        $variant = Variant::find($request->id);
        $variant->delete();
        return response()->json(['message' => 'deleted successfully'], 200);
    }
    public function deleteproduct(Request $request)
    {
        $product = Product::find($request->id);
        $product->delete();
        return response()->json(['message' => 'deleted successfully'], 200);
    }
    public function deletesubcategory(Request $request)
    {
        $subcategory = Subcategory::find($request->id);
        $subcategory->delete();
        return response()->json(['message' => 'deleted successfully'], 200);
    }
    public function deletecategory(Request $request)
    {
        $category = Category::find($request->id);
        $category->delete();
        return response()->json(['message' => 'deleted successfully'], 200);
    }
    public function deletebrand(Request $request)
    {
        $brand = Brand::find($request->id);
        $brand->delete();
        return response()->json(['message' => 'deleted successfully'], 200);
    }
    public function deletesection(Request $request)
    {
        $section = Section::find($request->id);
        $section->delete();
        return response()->json(['message' => 'deleted successfully'], 200);
    }
    public function deletebanner(Request $request)
    {
        $banner = Banner::find($request->id);
        $banner->delete();
        return response()->json(['message' => 'deleted successfully'], 200);
    }
    public function changebannerType(Request $request)
    {
        $banner = Banner::find($request->id);
    
       
    
        if ($banner->type == "featured") {
            $banner->type = "normal";
        } else {
            $banner->type = "featured";
        }
    
        $banner->save();
    
        return response()->json(['message' => 'Changes done successfully'], 200);
    }
    
   public function editsection(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $section = Section::find($id);
        $section->name = $request->name;
        if($request->hasFile('logo')){
            $file = $request->file('logo');
            $ext = $file->getClientOriginalExtension();
            $filename = time() . $request->name . '.' . $ext;
            $file->move('Section Image/', $filename);
            if ($section->image) {
                unlink(public_path('Section Image/' . $section->image));
            }
            $section->image = $filename;
        }
        $section->save();


        return redirect()->back()->with('success', 'Updated successfully!');
    }
    public function editbrand(Request $request, $id)
    {
        $request->validate([
            'section_id'         => 'required',
            'name'       => 'required|string|max:255',
            'image'       => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        $brand = Brand::find($id);       
        $brand->section_id = $request->section_id;
        $brand->name = $request->name;
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time() . $request->name . '.' . $file->getClientOriginalExtension();
            $path = 'BrandLogos/';
            $file->move($path, $filename);
            if ($brand->logo) {
                unlink(public_path($path . $brand->logo));
            }
            $brand->logo = $filename;
        }
        $brand->save();
        return redirect()->back()->with('success', 'saved successfully');
    }
    public function editcategory(Request $request, $id)
    {
        $request->validate([
            'section_id'         => 'required', 
            'brand_id'         => 'required', 
            'name'       => 'required|string|max:255',         
        ]);
        $category = Category::find($id);
        $category->section_id = $request->section_id;
        $category->brand_id = $request->brand_id;
        $category->name = $request->name;
        $category->save();
        return redirect()->back()->with('success', 'Updated successfully!');
    }
    public function editsubcategory(Request $request, $id)
    {
        $request->validate([
            'section_id' => 'required',
            'brand_id' => 'required',
            'category_id' => 'required',
            'name' => 'required'
        ]);

        $subcategory = Subcategory::find($id);
        $subcategory->section_id = $request->section_id;
        $subcategory->brand_id = $request->brand_id;
        $subcategory->category_id = $request->category_id;
        $subcategory->name = $request->name;
        $subcategory->save();
        return redirect()->back()->with('success', 'Updated successfully!');
    }
    public function editproduct(Request $request, $id)
    {
        $request->validate([
            'section_id' => 'required',
            'brand_id' => 'required',
            'category_id' => 'required',
            'subcategory_id' => 'required',
            'name' => 'required'
        ]);

        $product = Product::find($id);
        $product->section_id = $request->section_id;                       
        $product->brand_id =   $request->brand_id;
        $product->category_id = $request->category_id;
        $product->subcategory_id = $request->subcategory_id;
        $product->name = $request->name;
        $product->save();
        return redirect()->back()->with('success', 'Updated successfully!');
    }
     public function editvariant(Request $request, $id)
    {
        
        // dd($request->all());
        $request->validate([
            'section_id' => 'required',
            'brand_id' => 'required',
            'category_id' => 'required',
            'subcategory_id' => 'required',
            'product_id' => 'required',
            'name' => 'required',
            'price' => 'required',
            'description' => 'required',
            
        ]);

        $variant = Variant::find($id);
        $variant->section_id = $request->section_id;
        $variant->brand_id = $request->brand_id;
        $variant->category_id = $request->category_id;
        $variant->subcategory_id = $request->subcategory_id;
        $variant->product_id = $request->product_id;
        $variant->name = $request->name;
        $variant->price = $request->price;
        $variant->mrp = $request->mrp;
        $variant->description = $request->description;
        $image = $variant->image; 
        if($request->hasFile('image1')){
            $file1 = $request->file('image1');
            $ext = $file1->getClientOriginalExtension();
            $filename1 = time() . '_1.' . $ext;
            $file1->move('Product Image/', $filename1);
            if (isset($variant->image[0])) {
                unlink(public_path( 'Product Image/'. $variant->image[0]));
            }
            $image[0] = $filename1;
        }
        if($request->hasFile('image2')){
            $file2 = $request->file('image2');
            $ext = $file2->getClientOriginalExtension();
            $filename2 = time() . '_2.' . $ext;
            $file2->move('Product Image/', $filename2);
            if (isset($variant->image[1])) {
                unlink(public_path( 'Product Image/'. $variant->image[1]));
            }
            $image[1] = $filename2;
        }
        if($request->hasFile('image3')){
            $file3 = $request->file('image3');
            $ext = $file3->getClientOriginalExtension();
            $filename3 = time() . '_3.' . $ext;
            $file3->move('Product Image/', $filename3);
            if (isset($variant->image[2])) {
                unlink(public_path( 'Product Image/'. $variant->image[2]));
            }
            $image[2] = $filename3;
        }
        if($request->hasFile('image4')){
            $file4 = $request->file('image4');
            $ext = $file4->getClientOriginalExtension();
            $filename4 = time() . '_4.' . $ext;
            $file4->move('Product Image/', $filename4);
            if (isset($variant->image[3])) {
                unlink(public_path( 'Product Image/'. $variant->image[3]));
            }
            $image[3] = $filename4;
        }
        if($request->hasFile('image5')){
            $file5 = $request->file('image5');
            $ext = $file5->getClientOriginalExtension();
            $filename5 = time() . '_5.' . $ext;
            $file5->move('Product Image/', $filename5);
            if (isset($variant->image[4])) {
                unlink(public_path( 'Product Image/'. $variant->image[4]));
            }
            $image[4] = $filename5;
        } 
        $variant->image = $image;
        $variant->save();
        
        return redirect()->back()->with('success', 'Updated successfully!');
    }

    public function admin_manage_orders(Request $request){
        $data = Order::where('delivery_status', 'in progress')->orderBy('id', 'desc')->get();
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $btn = '&nbsp;&nbsp; <div class="dropdown ml-auto text-right">
                    <div class="btn-link" data-toggle="dropdown">
                        <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                            <g stroke="none" stroke-width="1" fill="none"
                                fill-rule="evenodd">
                                <rect x="0" y="0" width="24" height="24"></rect>
                                <circle fill="#fff" cx="5" cy="12" r="2">
                                </circle>
                                <circle fill="#fff" cx="12" cy="12" r="2">
                                </circle>
                                <circle fill="#fff" cx="19" cy="12" r="2">
                                </circle>
                            </g>
                        </svg>
                    </div>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="javascript:void(0)" data="'. $row->id .'" id="accept"> Accept Order</a>
                        <a class="dropdown-item" href="javascript:void(0)" data="'. $row->id .'" id="reject"> Reject Order</a>
                        <a class="dropdown-item" href="javascript:void(0)" data="'. $row->id .'" id="delivered"> Order Delivered</a>
                        <a class="dropdown-item" href="'.route("order-details", $row->id) .'"> View Details</a>
                    </div>
                </div>';
                    return $btn;
                })
                ->addColumn('user_id', function ($row){
                    $user = User::find($row->user_id);
                    return $user ? $user->name : 'N/A'; 
                })
                ->addColumn('created_at', function ($row){
                    $dateString = $row->created_at;
                    $dateTime = new DateTime($dateString);
                    $d = $dateTime->format('d F, Y');
                    return $d;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('admin.manage-orders', compact('data'));
    }

    public function delivered_orders(Request $request){
        $data = Order::where('delivery_status', 'delivered')->orderBy('id', 'desc')->get();
        if ($request->ajax()) {
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $btn = '&nbsp;&nbsp; <div class="dropdown ml-auto text-right">
                    <div class="btn-link" data-toggle="dropdown">
                        <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                            <g stroke="none" stroke-width="1" fill="none"
                                fill-rule="evenodd">
                                <rect x="0" y="0" width="24" height="24"></rect>
                                <circle fill="#fff" cx="5" cy="12" r="2">
                                </circle>
                                <circle fill="#fff" cx="12" cy="12" r="2">
                                </circle>
                                <circle fill="#fff" cx="19" cy="12" r="2">
                                </circle>
                            </g>
                        </svg>
                    </div>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="'.route("order-details", $row->id) .'"> View Details</a>
                    </div>
                </div>';
                    
                    return $btn;
                })
                ->addColumn('user_id', function ($row){
                    $user = User::find($row->user_id);
                    return $user ? $user->name : 'N/A'; 
                })
                ->addColumn('created_at', function ($row){
                    $dateString = $row->created_at;
                    $dateTime = new DateTime($dateString);
                    $d = $dateTime->format('d F, Y');
                    return $d;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }

    public function accept($id, Request $request){
        $order = Order::find($id);
        $order->approval_status = 'approved';
        $order->save();
        return response()->json(['success' => true]);
    }
    
    public function reject($id, Request $request){
        $order = Order::find($id);
        $order->delete();
        return response()->json(['success' => true]);
    }
    
    public function delivered($id, Request $request){
        $order = Order::find($id);
        $order->approval_status = 'approved';
        $order->pay_status = 'paid';
        $order->delivery_status = 'delivered';
        $order->save();
        return response()->json(['success' => true]);
    }

    public function order_details($id){
        $order = Order::find($id);
        $user = User::find($order->user_id);
        $detail = json_decode($order->details);
        return view('admin.order-details', compact('order', 'user', 'detail'));
    }
    
    public function brand_discount($id, Request $request){
        $brand = Brand::find($id);
        $variants = Variant::where('brand_id', $id)->get();
        $request->validate([
            'discount' => 'required',    
        ]);
        $brand->discount = $request->discount;
        $brand->save();
        foreach($variants as $v){
            $v->disprice = (int)$v->price - (int)$request->discount*(int)$v->price/100;
            $v->save();
        }
        return response()->json(['success' => 'updated successfully!']);
    }
    
}
