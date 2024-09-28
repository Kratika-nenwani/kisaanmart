@extends('admin.index-main')
@section('csscontent')
@endsection
@section('content')
    <div class="container py-5">
        <div class="row justify-content-center">
            <input type="hidden" id="id" value="{{ $id }}">
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
                    <h3>Manage Brand</h3>
                    <a data-bs-toggle="modal" href="#add_blog" class="btn btn-info float-end">+ Add Brand</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered yajra_datatable">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Section</th>
                                <th>Name</th>
                                <th>Logo</th>
                                <th>Action</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            <div style="width:100%;" class="modal fade twm-sign-up" id="add_blog" aria-hidden="true"
                aria-labelledby="sign_up_popupLabel2" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h2 class="modal-title" id="sign_up_popupLabel2">Add Brand</h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <div class="twm-tabs-style-2">
                                <form id="f" action="{{ Route('savebrand') }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="row">
                                        <input type="hidden" name="section_id" id="section" value="{{ $id }}">
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <label for="name"><b>Name</b></label>
                                                <input type="text" class="form-control" name="name" id="name"
                                                    style="color: white; ">
                                            </div>
                                        </div>
                                        <!-- Logo -->
                                        <div class="col-lg-12">
                                            <div class="form-group mb-3">
                                                <label for="logo"><b>Logo</b></label>
                                                <input type="file" name="logo" id="logo" class="form-control"
                                                    required style="color: white; ">
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
    </div>
    @foreach ($data as $brand)
        <div style="width:100%;" class="modal fade twm-sign-up" id="editModal{{ $brand->id }}" tabindex="-1"
            role="dialog" aria-labelledby="exampleModalLabel{{ $brand->id }}" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel{{ $brand->id }}">Edit Brand</h5>
                    </div>
                    <div class="modal-body">
                        <!-- Form for editing blog -->
                        <form id="editForm{{ $brand->id }}" action="{{ route('editbrand', ['id' => $brand->id]) }}"
                            method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label for="section">Section</label>
                                        <select name="section_id" id="section" class="form-select" required>
                                            @foreach ($sections as $section)
                                                <option value="{{ $section->id }}"
                                                    @if ($section->id == $brand->section_id) selected @endif>{{ $section->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label for="name">Name</label>
                                        <input name="name" type="text" id="name" class="form-control"
                                            value="{{ $brand->name }}" required style="color: white; ">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label for="image">logo</label>
                                        <img src="{{ asset('BrandLogos/' . $brand->logo) }}"
                                            style="width:100px; height:auto;" alt="">
                                        <input name="image" type="file" id="image" class="form-control"
                                            style="color: white; ">
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
                    url: "{{ route('brand-by-section', ['id' => ':id']) }}".replace(':id', id),
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
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'logo',
                        name: 'logo'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'action1',
                        name: 'action1',
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
            var url = "{{ route('deletebrand') }}";
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
