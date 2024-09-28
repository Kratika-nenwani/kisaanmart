@extends('admin.index-main')
@section('csscontent')
@endsection
@section('content')
    <div class="container mt-5  ">
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
                    <h3>Manage Banner</h3>
                    <a data-bs-toggle="modal" href="#add_blog" class="btn btn-info float-end">+ Add Banner</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered yajra_datatable">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    
                                    <th>Image</th>
                                    <th>Type</th>
                                    <th>Action</th>
                                    <th>Action 2</th>
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
                            <h2 class="modal-title" id="sign_up_popupLabel2">Add Banner</h2>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="f" action="{{ route('savebanner') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                <div class="row">

                                    
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="image"><b>Image</b></label>
                                            <input type="file" name="image" id="image" class="form-control"
                                                required style="color: white; ">
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12">
                                        <div class="form-group mb-3">
                                            <label for="type"><b>Type</b></label>
                                            <input type="text" class="form-control" name="type" id="type"
                                                style="color: white;">
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
                ajax: "{{ route('admin-manage-banner') }}",
                columns: [{
                        data: 'id',
                        name: 'id'
                    },
                    
                    {
                        data: 'image',
                        name: 'image',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'type',
                        name: 'type'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data:'action2',
                        name:'action2'
                    },
                    
                ]
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.all.min.js"></script>
    <script type="text/javascript">
        $(document).on('click', '.delete', function() {
            var row_id = $(this).attr('id');
            console.log(row_id);
            var table_row = $(this).closest('tr');
            var url = "{{ route('deletebanner') }}";
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
                                window.location.reload();
                            });
                        }
                    });
                }
            })
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

<script type="text/javascript">
    $(document).on('click', '.changeType', function() {
        var row_id = $(this).attr('id');
        var table_row = $(this).closest('tr');
        var url = "{{ route('changebannerType') }}";

        Swal.fire({
            title: 'Confirm Change',
            background: "#25383C",
            text: "Are you sure you want to change the type?",
            icon: 'question', 
            showCancelButton: true,
            confirmButtonColor: '#4caf50', 
            cancelButtonColor: '#f44336',
            confirmButtonText: 'Yes, change it!',
            cancelButtonText: 'No, cancel',
            reverseButtons: true,
            allowOutsideClick: false,
            allowEscapeKey: false,
            
            
            showClass: {
                popup: 'animate__animated animate__zoomIn'
            },
            hideClass: {
                popup: 'animate__animated animate__zoomOut'
            },
            customClass: {
                title: 'swal2-title-style',
                content: 'swal2-content-style',
                actions: 'swal2-actions-style',
                confirmButton: 'swal2-confirm-button-style',
                cancelButton: 'swal2-cancel-button-style'
            }
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
                            title: 'Type Changed!',
                            text: 'The type of image has been successfully changed.',
                            icon: 'success',
                            confirmButtonText: 'OK',
                            confirmButtonColor: '#4caf50', // Green color
                            showClass: {
                                popup: 'animate__animated animate__bounceIn'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__bounceOut'
                            }
                        }).then((result) => {
                            window.location.reload();
                        });
                    }
                });
            }
        });
    });
</script>

@endsection
