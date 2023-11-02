import 'package:flutter/material.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slider_button/slider_button.dart';

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
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 37,
      ),
      child: SizedBox(
          height: 50,
          width: 320,
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.cyan[800]),
              onPressed: () {
                var options = {
                  'key': 'rzp_test_YAcpXaRk23e0zV',
                  'amount': 1 * 100,
                  'name': 'Acme Corp.',
                  'order_id': 'order_EMBFqjDHEEn80l',
                  'description': 'Fine T-Shirt',
                  'timeout': 60,
                };
                _razorpay.open(options);
              },
              child: const Text('Proceed to Pay',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
            ),
          )),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {}

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}
}
