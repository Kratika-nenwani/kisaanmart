@extends('admin.index-main')
@section('csscontent')
    
@endsection
@section('content')
    <div class="p-5">
        <h1>Order No. #{{ $order->orderno }}</h1>
        <p>Manage Orders / Order Details</p>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <div class="card" style="border-top-left-radius: 50px; border-top-right-radius: 50px; background-color:chocolate;">
                <div class="text-center">
                    <h2 class="my-3 text-light">{{ $user->name }}</h2>
                    <a class="btn btn-outline-dark light">Customer</a>
                    <br><br>
                    <div style="border-top-left-radius: 50px; border-top-right-radius: 50px; background-color:brown;" class="px-0 pt-2">
                        <h3>Order Note</h3>
                        <p><b>Email : </b>{{ $user->email }}</p>
                        <p><b>Phone : </b>{{ $user->phone }}</p>
                        <?php
                            $dateString = $order->created_at;
                            $dateTime = new DateTime($dateString);
                            $d = $dateTime->format('d F, Y');
                        ?>
                        <p><b>Order Date : </b>{{ $d }}</p>
                        <div style="border-top-left-radius: 50px; border-top-right-radius: 50px; background-color:blanchedalmond; color:black;" class="px-0 py-2">
                            <p><b>Location : <br></b>{{ $order->cod_address }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="card" style="border-top-left-radius: 50px; border-top-right-radius: 50px; background-color:brown;">
                <div class="card-body pt-2">
                    <div class="table-responsive ">
                        <table class="table items-table">
                            <thead>
                                <tr>
                                    <th class="my-0 text-black font-w500 fs-20">Items</th>
                                    <th style="width:10%;" class="my-0 text-black font-w500 fs-20">Qty</th>
                                    <th style="width:10%;" class="my-0 text-black font-w500 fs-20">Price
                                    </th>
                                    <th class="my-0 text-black font-w500 fs-20">Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($detail as $d)
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <img class="mr-3 img-fluid rounded" width="85"
                                                    src="{{ asset('Product Image/' . $d->image) }}"
                                                    alt="DexignZone">
                                                <div class="media-body">
                                                    <h5 class="mt-0 mb-2 text-black mb-4">
                                                        {{ $d->name }}</h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <h4 class="my-0 text-light font-w600">{{ $d->quantity }}x
                                            </h4>
                                        </td>
                                        <td>
                                            <h4 class="my-0 text-light font-w600">₹ {{ $d->price }}
                                            </h4>
                                        </td>
                                        <td>
                                            <h4 class="my-0 text-light font-w600">₹ {{ $d->total }}
                                            </h4>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('jscontent')
    
@endsection
