import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/cart/cart_view.dart';
import 'package:giltezy_2ndproject/widgets/checkout/address_view.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  var _razorpay = Razorpay();
  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
    // TODO: implement dispose
  }

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
                var options = {
                  'key': 'rzp_test_YAcpXaRk23e0zV',
                  'amount': 1 * 100, //in the smallest currency sub-unit.
                  'name': 'Acme Corp.',
                  'order_id':
                      'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                  'description': 'Fine T-Shirt',
                  'timeout': 60, // in seconds
                };
                _razorpay.open(options);
              },
              child: Text("data")),
        )
      ]),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
}
