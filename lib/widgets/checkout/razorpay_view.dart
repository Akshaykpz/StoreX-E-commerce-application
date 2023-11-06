// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:slider_button/slider_button.dart';

// class CheckOut extends StatefulWidget {
//   const CheckOut({super.key});

//   @override
//   State<CheckOut> createState() => _CheckOutState();
// }

// class _CheckOutState extends State<CheckOut> {
//   var _razorpay = Razorpay();
//   @override
//   void dispose() {
//     _razorpay.clear();
//     super.dispose();
//     // TODO: implement dispose
//   }

//   @override
//   void initState() {
//     super.initState();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }

//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 37,
//       ),
//       child: SizedBox(
//           height: 50,
//           width: 320,
//           child: SizedBox(
//             height: 45,
//             child: ElevatedButton(
//               style:
//                   ElevatedButton.styleFrom(backgroundColor: Colors.cyan[800]),
//               onPressed: () {
//                 var options = {
//                   'key': 'rzp_test_YAcpXaRk23e0zV',
//                   'amount': 1 * 100,
//                   'name': 'Acme Corp.',
//                   'order_id': 'order_EMBFqjDHEEn80l',
//                   'description': 'Fine T-Shirt',
//                   'timeout': 60,
//                 };
//                 _razorpay.open(options);
//               },
//               child: const Text('Proceed to Pay',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white)),
//             ),
//           )),
//     );
//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     Fluttertoast.showToast(
//         msg: "Success${response.paymentId}",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(response.message ?? 'error')));
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(response.walletName ?? 'error')));
//   }
// }
// ... imports

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giltezy_2ndproject/service/check_out.dart';
import 'package:giltezy_2ndproject/widgets/checkout/check_out_items_view.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOut extends StatefulWidget {
  final DocumentReference? productReference;
  CheckOut({Key? key, this.productReference});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  var _razorpay = Razorpay();

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[800]),
            onPressed: () {
              var options = {
                'key': 'rzp_test_YAcpXaRk23e0zV',
                'amount': 1 * 100,
                'name': 'Acme Corp.',
                'description': 'Fine T-Shirt',
                'timeout': 60,
                'prefill': {
                  'contact': 'YOUR_CONTACT_NUMBER',
                  'email': 'YOUR_EMAIL'
                },
                'external': {
                  'wallets': ['googlepay']
                }
              };
              try {
                _razorpay.open(options);
              } catch (e) {
                print(e.toString());
              }
            },
            child: const Text('Proceed to Pay',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Success: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    DataAdd().checOutitems(response.paymentId!, widget.productReference);
    print(" {$widget.productReference  ");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.message ?? 'Payment error')));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    // Handle the external wallet response here
  }
}
