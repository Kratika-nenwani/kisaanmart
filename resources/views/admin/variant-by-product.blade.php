@extends('admin.index-main')
@section('csscontent')
@endsection
@section('content')
    <div class="container py-5">
        <div class="row justify-content-center">
            <input type="hidden" id="id" value="{{ $id }}">
            <div class="card">
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
            @if(session('error'))
    {{ session('error') }}
@endif

            <div style="width:100%;" class="modal fade twm-sign-up" id="add_blog" aria-hidden="true"
                aria-labelledby="sign_up_popupLabel2" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h2 class="modal-title" id="sign_up_popupLabel2">Add variant</h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <div class="twm-tabs-style-2">
                                <form id="f" action="{{ Route('savevariant') }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="tab-content" id="myTab2Content">
                                        <!-- Brand Information -->
                                        <div class="tab-pane fade show active" id="brand-info">
                                            <div class="row">
                                                <!-- Name -->
                                                <div class="col-lg-12">
                                                    <div class="form-group mb-3">
                                                        <label for="name"><b>Name</b></label>
                                                        <input type="text" class="form-control" name="name"
                                                            id="name" style="color: white; " required>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="form-group mb-3">
                                                        <label for="price"><b>Price</b></label>
                                                        <input type="text" class="form-control" name="price"
                                                            id="price" style="color: white; " required>
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
                                                        <label for="description"><b>Description</b></label>
                                                        <input type="text" class="form-control" name="description"
                                                            id="description" style="color: white; " required>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="form-group mb-3">
                                                        <label for="rating"><b>Rating</b></label>
                                                        <input type="text" class="form-control" name="rating"
                                                            id="rating" style="color: white; " required>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="form-group mb-3">
                                                        <label for="image1"><b>Image</b></label>
                                                        <input type="file" name="image1" id="image1"
                                                            class="form-control" required style="color: white; ">
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
                                                <input type="hidden" name="product_id" value="{{ $id }}">
                                                <input type="hidden" name="subcategory_id" value="{{ $subcategory_id }}">
                                                <input type="hidden" name="category_id" value="{{ $category_id }}">
                                                <input type="hidden" name="brand_id" value="{{ $brand_id }}">
                                                <input type="hidden" name="section_id" value="{{ $section_id }}">
                                                    <button id="submit" type="submit"
                                                        class="btn btn-outline-success"><b>Add Variant</b></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                        <form id="editForm{{ $variant->id }}" action="{{ route('editvariant', ['id' => $variant->id]) }}"
                            method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="tab-content" id="myTab2Content">
                                <!--Login Candidate Content-->
                                <div class="tab-pane fade show active" id="login-candidate">
                                    <div class="row">
                                        
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
                                        <input type="hidden" name="product_id" value="{{ $id }}">
                                                <input type="hidden" name="subcategory_id" value="{{ $subcategory_id }}">
                                                <input type="hidden" name="category_id" value="{{ $category_id }}">
                                                <input type="hidden" name="brand_id" value="{{ $brand_id }}">
                                                <input type="hidden" name="section_id" value="{{ $section_id }}">
                                            <button type="submit" class="btn btn-outline-success">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
@endsection
@section('jscontent')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.5/js/dataTables.bootstrap5.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var id = $('#id').val();
            var table = $('.yajra_datatable').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ route('variant-by-product', ['id' => ':id']) }}".replace(':id', id),
                },
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
