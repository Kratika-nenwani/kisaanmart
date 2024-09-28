<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Cart;
use App\Models\Order;
use Illuminate\Support\Facades\Http;
use Ixudra\Curl\Facades\Curl;


class OrderController extends Controller
{
    public function cash_on_delivery(Request $request){
        $user = User::find($request->user_id);
        $cart = Cart::where('user_id', $request->user_id)->get();
        $itemno = $cart->sum('quantity');
        $o = Order::max('orderno');
        $order = new Order();
        $order->orderno = (int)$o + 1 ;
        $order->itemsno = $itemno;
        $order->details = $cart;
        $order->user_id = $user->id;
        $order->total = $cart->sum('total');
        $order->delivery_status = 'in progress';
        $order->pay_status = 'pending';
        $order->approval_status = 'unapproved';
        $order->cod_address = $request->address;
        $order->save();
        foreach($cart as $c){
            $c->delete();
        }
        
        return response()->json([
            'message' => 'Order added successfully',
            'order' => $order
        ], 200);
        
    }
    
    public function pending_orders($id){
        $orders = Order::where('user_id', $id)->where('delivery_status', 'in progress')->get();
        $total = [];
        foreach($orders as $order){
            $xs = json_decode($order->details);
            $count = 0;
            foreach($xs as $x){
                if (isset($x->total)) {
                    $count += $x->total;
                }
            }
            $total[] = $count;
            $order->total = $count;
            $order->save();
        }
        return response()->json([
                'orders' => $orders,
                'total' => $total
            ], 200);
    }
    
    public function delivered_orders($id){
        $orders = Order::where('user_id', $id)->where('delivery_status', 'delivered')->get();
        $total = [];
        foreach($orders as $order){
            $xs = json_decode($order->details);
            $count = 0;
            foreach($xs as $x){
                if (isset($x->total)) {
                    $count += $x->total;
                }
            }
            $total[] = $count;
        }
        return response()->json([
                'orders' => $orders,
                'total' => $total
            ], 200);
    }
    
    public function order_details($id){
        $order = Order::find($id)->details;
        $order = json_decode($order);
        return response()->json([
                'order' => $order,
                'id' => $id
            ]);
    }
    
    public function phonepe(Request $request)
    {
        $user = User::find($request->user_id);
        $cart = Cart::where('user_id', $request->user_id)->get();
        $amount = 0;
        foreach($cart as $c){
            $amount += $c->total;
        }
        $data = array (
          'merchantId' => 'M22B6G7M1CW7L',
          'merchantTransactionId' => time().'transact'.$user->id,
          'merchantUserId' => 'KISAANMART001',
          'amount' => $amount * 100,
          'redirectUrl' => route('phonepe-response',['user_id' => $user->id, 'address' => $request->address]),
          'redirectMode' => 'POST',
          'callbackUrl' => route('phonepe-response',['user_id' => $user->id, 'address' => $request->address]),
          'mobileNumber' => '9238788671',
          'paymentInstrument' => 
          array (
            'type' => 'PAY_PAGE',
          ),
        );
        

        $encode = base64_encode(json_encode($data));

        $saltKey = '29e061db-c3e5-41f1-a0ae-b228b63c1cab';
        $saltIndex = 1;

        $string = $encode.'/pg/v1/pay'.$saltKey;
        $sha256 = hash('sha256',$string);

        $finalXHeader = $sha256.'###'.$saltIndex;

        $curl = curl_init();

        curl_setopt_array($curl, array(
          CURLOPT_URL => 'https://api.phonepe.com/apis/hermes/pg/v1/pay',
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => '',
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 0,
          CURLOPT_FOLLOWLOCATION => false,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => 'POST',
          CURLOPT_POSTFIELDS => json_encode(['request' => $encode]),
          CURLOPT_HTTPHEADER => array(
            'Content-Type: application/json',
            'X-VERIFY: '.$finalXHeader
          ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);

        $rData = json_decode($response);
        // return $rData;
        return response()->json([
            'url' => $rData->data->instrumentResponse->redirectInfo->url,
        ], 200);
    }

    public function phonepe_response($user_id, $address, Request $request)
    {
        $user = User::find($user_id);
        $cart = Cart::where('user_id', $user->id)->get();
        $amount = 0;
        foreach($cart as $c){
            $amount += $c->total;
        }
        $itemno = $cart->sum('quantity');
        $o = Order::max('orderno');
        
        
        $input = $request->all();
        $saltKey = '29e061db-c3e5-41f1-a0ae-b228b63c1cab';
        $saltIndex = 1;

        
        $finalXHeader = hash('sha256','/pg/v1/status/'.$request['merchantId'].'/'.$request['transactionId'].$saltKey).'###'.$saltIndex;
        $curl = curl_init();

        curl_setopt_array($curl, array(
          CURLOPT_URL => 'https://api.phonepe.com/apis/hermes/pg/v1/status/'.$request['merchantId'].'/'.$request['transactionId'],
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => '',
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 0,
          CURLOPT_FOLLOWLOCATION => false,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => 'GET',
          CURLOPT_HTTPHEADER => array(
            'Content-Type: application/json',
            'accept: application/json',
            'X-VERIFY: ' . $finalXHeader,
            'X-MERCHANT-ID: ' . $request['merchantId']
          ),
        ));
        
        $response = curl_exec($curl);
        
        curl_close($curl);
        $data = json_decode($response);

        if($data->success == true){
            $order = new Order();
            $order->orderno = (int)$o + 1 ;
            $order->itemsno = $itemno;
            $order->details = $cart;
            $order->user_id = $user->id;
            $order->total = $amount;
            $order->delivery_status = 'in progress';
            $order->pay_status = 'paid';
            $order->approval_status = 'approved';
            $order->cod_address = $address;
            $order->save();
            foreach($cart as $c){
                $c->delete();
            }
            return redirect()->route('success');
        }else{
            return redirect()->route('failed');
        }
    }
}
