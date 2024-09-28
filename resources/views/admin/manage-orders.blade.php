@extends('admin.index-main')
@section('csscontent')
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
@endsection
@section('content')
    <div class="p-5">
        <h1>Orders</h1>
        <p>Here is your order list data</p>
    </div>
    <div>
        <h1>Pending Orders</h1>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered yajra_datatable">
                    <thead>
                        <tr>
                            <th>Order No.</th>
                            <th>Date</th>
                            <th>Customer Name</th>
                            <th>COD Address</th>
                            <th>Amount</th>
                            <th>Delivery Status</th>
                            <th>Pay Status</th>
                            <th>Approval Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <br><br><br>
    <div>
        <h1>Delivered Orders</h1>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered yajra_datatable2">
                    <thead>
                        <tr>
                            <th>Order No.</th>
                            <th>Date</th>
                            <th>Customer Name</th>
                            <th>COD Address</th>
                            <th>Amount</th>
                            <th>Delivery Status</th>
                            <th>Pay Status</th>
                            <th>Approval Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
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
            var table = $('.yajra_datatable').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('admin-manage-orders') }}",
                columns: [{
                        data: 'orderno',
                        name: 'orderno',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'created_at',
                        name: 'created_at',
                    },
                    {
                        data: 'user_id',
                        name: 'user_id',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'cod_address',
                        name: 'cod_address',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'total',
                        name: 'total',
                    },
                    {
                        data: 'delivery_status',
                        name: 'delivery_status',
                    },
                    {
                        data: 'pay_status',
                        name: 'pay_status',
                    },
                    {
                        data: 'approval_status',
                        name: 'approval_status',
                        
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
    <script type="text/javascript">
        $(function() {
            var table = $('.yajra_datatable2').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('delivered-orders') }}",
                columns: [{
                        data: 'orderno',
                        name: 'orderno',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'created_at',
                        name: 'created_at',
                    },
                    {
                        data: 'user_id',
                        name: 'user_id',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'cod_address',
                        name: 'cod_address',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'total',
                        name: 'total',
                    },
                    {
                        data: 'delivery_status',
                        name: 'delivery_status',
                    },
                    {
                        data: 'pay_status',
                        name: 'pay_status',
                    },
                    {
                        data: 'approval_status',
                        name: 'approval_status',
                        
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
        $(document).on('click', '#accept', function() {
            var row_id = $(this).attr('data');
            console.log(row_id);
            var table_row = $(this).closest('tr');
            var url = "{{ route('accept',':id') }}";
            Swal.fire({
                title: 'Are you sure?',
                text: "You want to accept this order!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, accept it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'get',
                        url: url.replace(':id', row_id),
                        data: {
                            _token: '{{ csrf_token() }}',
                            id: row_id,
                        },
                        success: function(data) {
                            Swal.fire({
                                title: 'Accepted!',
                                text: 'New order is accepted.',
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then((result) => {
                                window.location.reload();
                            });
                        }
                    });
                }
            })
        });
        $(document).on('click', '#reject', function() {
            var row_id = $(this).attr('data');
            console.log(row_id);
            var table_row = $(this).closest('tr');
            var url = "{{ route('reject',':id') }}";
            Swal.fire({
                title: 'Are you sure?',
                text: "You want to reject this order!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, reject it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'get',
                        url: url.replace(':id', row_id),
                        data: {
                            _token: '{{ csrf_token() }}',
                            id: row_id,
                        },
                        success: function(data) {
                            Swal.fire({
                                title: 'Rejected!',
                                text: 'Order is rejected and deleted from record!',
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then((result) => {
                                window.location.reload();
                            });
                        }
                    });
                }
            })
        });
        $(document).on('click', '#delivered', function() {
            var row_id = $(this).attr('data');
            console.log(row_id);
            var table_row = $(this).closest('tr');
            var url = "{{ route('delivered',':id') }}";
            Swal.fire({
                title: 'Are you sure?',
                text: "You want to mark this order as delivered and payment is paid!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, its delivered and paid!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'get',
                        url: url.replace(':id', row_id),
                        data: {
                            _token: '{{ csrf_token() }}',
                            id: row_id,
                        },
                        success: function(data) {
                            Swal.fire({
                                title: 'Delivered!',
                                text: 'Order is delivered and payment taken.',
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then((result) => {
                                window.location.reload();
                            });
                        }
                    });
                }
            })
        });
    </script>
@endsection
