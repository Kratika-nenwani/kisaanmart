@extends('admin.index-main')
@section('csscontent')
    <style>
        textarea {
            color: white;
        }
    </style>
@endsection
@section('content')
    <div class="container mt-3">
        <div class="row justify-content-center">
            <div class="card">
                @if ($errors->any())
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Error:</strong>FAILED! Please fix the following issues:
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                @endif
                <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
                    <h3>Manage Variant</h3>
                    <a data-bs-toggle="modal" href="#add_blog" class="btn btn-info float-end">+ Add Variant</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered yajra_datatable">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Section</th>
                                <th>Brand</th>
                                <th>Category</th>
                                <th>SubCategory</th>
                                <th>Product</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div style="width:100%;" class="modal fade twm-sign-up" id="add_blog" aria-hidden="true"
            aria-labelledby="sign_up_popupLabel2" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header">
                        <h2 class="modal-title" id="sign_up_popupLabel2">Add Variant</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <div class="twm-tabs-style-2">
                            <form id="f" action="{{ Route('savevariant') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                <div class="row">

                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="section">Section</label>
                                            <select name="section_id" id="section" class="form-select" required>
                                                <option value="" selected disabled>Selection Section
                                                </option>
                                                @foreach ($sections as $section)
                                                    <option value="{{ $section->id }}">{{ $section->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="brand">Brand</label>
                                            <select name="brand_id" id="brand" class="form-select" required>
                                                <option value="" selected disabled>Selection Brand
                                                </option>
                                                @foreach ($brands as $brand)
                                                    <option value="{{ $brand->id }}">{{ $brand->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="category">Category</label>
                                            <select name="category_id" id="category" class="form-select" required>
                                                <option value="" selected disabled>Select Category
                                                </option>
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}">{{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="subcategory">SubCategory</label>
                                            <select name="subcategory_id" id="subcategory" class="form-select"
                                                required>
                                                <option value="" selected disabled>Select SubCategory
                                                </option>
                                                @foreach ($subcategories as $subcategory)
                                                    <option value="{{ $subcategory->id }}">{{ $subcategory->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="product">Product</label>
                                            <select name="product_id" id="product" class="form-select" required>
                                                <option value="" selected disabled>Select Product
                                                </option>
                                                @foreach ($products as $product)
                                                    <option value="{{ $product->id }}">{{ $product->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="name"><b>Name</b></label>
                                            <input type="text" class="form-control" name="name" id="name"
                                                style="color: white;" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="mrp"><b>M.R.P.</b></label>
                                            <input type="text" class="form-control" name="mrp" id="mrp"
                                                style="color: white;" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="price"><b>Price</b></label>
                                            <input type="text" class="form-control" name="price" id="price"
                                                style="color: white;" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="description"><b>Description</b></label>
                                            <textarea class="form-control" name="description" id="description" style="color: white;" required rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="image"><b>Main Image</b></label>
                                            <input type="file" name="image1" id="image"
                                                class="form-control" required style="color: white;">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="image"><b>Image 2</b></label>
                                            <input type="file" name="image2" id="image"
                                                class="form-control" style="color: white;">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="image"><b>Image 3</b></label>
                                            <input type="file" name="image3" id="image"
                                                class="form-control" style="color: white;">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="image"><b>Image 4</b></label>
                                            <input type="file" name="image4" id="image"
                                                class="form-control" style="color: white;">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="image"><b>Image 5</b></label>
                                            <input type="file" name="image5" id="image"
                                                class="form-control" style="color: white;">
                                        </div>
                                    </div>
                                    <!-- Submit Button -->
                                    <div class="col-md-12" style="text-align: center;">
                                        <button id="submit" type="submit" class="btn btn-info"><i
                                                class="mdi mdi-upload btn-icon-prepend"></i> Save</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@foreach ($data as $variant)
    <div style="width:100%;" class="modal fade twm-sign-up" id="editModal{{ $variant->id }}" tabindex="-1"
        role="dialog" aria-labelledby="exampleModalLabel{{ $variant->id }}" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel{{ $variant->id }}">Edit Variant</h5>
                </div>
                <div class="modal-body">
                    <!-- Form for editing blog -->
                    <form id="editForm{{ $variant->id }}"
                        action="{{ route('editvariant', ['id' => $variant->id]) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="section">Section</label>
                                    <select name="section_id" id="section" class="form-select"
                                        required>
                                        @foreach ($sections as $section)
                                            <option value="{{ $section->id }}" @if($section->id == $variant->section_id) selected @endif>{{ $section->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="brand">Brand</label>
                                    <select name="brand_id" id="brand" class="form-select" required>
                                        @foreach ($brands as $brand)
                                            <option value="{{ $brand->id }}" @if($brand->id == $variant->brand_id) selected @endif>{{ $brand->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="category">Category</label>
                                    <select name="category_id" id="category" class="form-select" required>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}" @if($category->id == $variant->category_id) selected @endif>{{ $category->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="subcategory">SubCategory</label>
                                    <select name="subcategory_id" id="subcategory" class="form-select" required>
                                        @foreach ($subcategories as $subcategory)
                                            <option value="{{ $subcategory->id }}" @if($subcategory->id == $variant->subcategory_id) selected @endif>{{ $subcategory->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="product">Product</label>
                                    <select name="product_id" id="product" class="form-select" required>
                                        @foreach ($products as $product)
                                            <option value="{{ $product->id }}" @if($product->id == $variant->product_id) selected @endif>{{ $product->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="name"><b>Name</b></label>
                                    <input type="text" class="form-control" name="name" id="name" value="{{ $variant->name }}"
                                        style="color: white;" required>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="mrp"><b>M.R.P.</b></label>
                                    <input type="text" class="form-control" name="mrp" id="mrp" value="{{ $variant->mrp }}"
                                        style="color: white;" required>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="price"><b>Price</b></label>
                                    <input type="text" class="form-control" name="price" id="price" value="{{ $variant->price }}"
                                        style="color: white;" required>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="description"><b>Description</b></label>
                                    <textarea class="form-control" name="description" id="description" style="color: white;" required>{{ $variant->description }}</textarea>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="image"><b>Main Image</b></label>
                                    <img src="{{ asset('Product Image/'. $variant->image[0] ) }}" alt="" style="width:100px; height:auto;">
                                    <input type="file" name="image1" id="image" class="form-control"
                                         style="color: white;">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="image"><b>Image 2</b></label>
                                    @if (isset($variant->image[1]))
                                    <img src="{{ asset('Product Image/'. $variant->image[1] ) }}" alt="" style="width:100px; height:auto;"> 
                                    @endif
                                    <input type="file" name="image2" id="image" class="form-control"
                                        style="color: white;">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="image"><b>Image 3</b></label>
                                    @if (isset($variant->image[2]))
                                    <img src="{{ asset('Product Image/'. $variant->image[2] ) }}" alt="" style="width:100px; height:auto;"> 
                                    @endif
                                    <input type="file" name="image3" id="image" class="form-control"
                                        style="color: white;">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="image"><b>Image 4</b></label>
                                    @if (isset($variant->image[3]))
                                    <img src="{{ asset('Product Image/'. $variant->image[3] ) }}" alt="" style="width:100px; height:auto;"> 
                                    @endif
                                    <input type="file" name="image4" id="image" class="form-control"
                                        style="color: white;">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group mb-3">
                                    <label for="image"><b>Image 5</b></label>
                                    @if (isset($variant->image[4]))
                                    <img src="{{ asset('Product Image/'. $variant->image[4] ) }}" alt="" style="width:100px; height:auto;"> 
                                    @endif
                                    <input type="file" name="image5" id="image" class="form-control"
                                        style="color: white;">
                                </div>
                            </div>
                            <div class="col-md-12" style="text-align: center;">
                                <button type="submit" class="btn btn-info"><i
                                        class="mdi mdi-upload btn-icon-prepend"></i> Update</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endforeach
@section('jscontent')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap5.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var table = $('.yajra_datatable').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('admin-manage-variant') }}",
                columns: [{
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'section_id',
                        name: 'section_id'
                    },
                    {
                        data: 'brand_id',
                        name: 'brand_id'
                    },
                    {
                        data: 'category_id',
                        name: 'category_id'
                    },
                    {
                        data: 'subcategory_id',
                        name: 'subcategory_id'
                    },
                    {
                        data: 'product_id',
                        name: 'product_id'
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'image',
                        name: 'image',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'price',
                        name: 'price'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    },
                ]
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.all.min.js"></script>
    <script type="text/javascript">
        $(document).on('click', '.delete', function() {
            var row_id = $(this).attr('id');
            var table_row = $(this).closest('tr');
            var url = "{{ route('deletevariant') }}";
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'get',
                        url: url,
                        data: {
                            _token: '{{ csrf_token() }}',
                            id: row_id,
                        },
                        success: function(data) {
                            Swal.fire({
                                title: 'Deleted!',
                                text: 'Your file has been deleted.',
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then((result) => {
                                table_row.remove();
                            });
                        }
                    });
                }
            })
        });
    </script>
@endsection
