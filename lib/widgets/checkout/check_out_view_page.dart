// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:giltezy_2ndproject/controller/provder_auth.dart';
// import 'package:giltezy_2ndproject/service/cart_total.dart';
// import 'package:giltezy_2ndproject/widgets/checkout/address_edit_button.dart';
// import 'package:giltezy_2ndproject/widgets/checkout/address_view.dart';
// import 'package:giltezy_2ndproject/widgets/checkout/check_out_items_view.dart';
// import 'package:giltezy_2ndproject/widgets/checkout/razorpay_view.dart';

// class CheckOutPage extends ConsumerStatefulWidget {
//   const CheckOutPage({Key? key}) : super(key: key);

//   @override
//   ConsumerState<CheckOutPage> createState() => _DataState();
// }

// class _DataState extends ConsumerState<CheckOutPage> {
//   @override
//   Widget build(BuildContext context) {
//     final cartAsyncValue = ref.watch(cartContentsProvider);
//     final productAsyncValue = ref.watch(productList);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//       ),
//       bottomSheet: Flex(direction: Axis.horizontal, children: [
//         Container(
//           height: 150,
//           width: 410,
//           // color: Colors.red,
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 cartAsyncValue.when(
//                     data: (cart) {
//                       return productAsyncValue.when(
//                         data: (productli) {
//                           final total = CartTotal().calculateTotal(
//                               cartData: cart, product: productli);
//                                final deliveryCharge = 20.0;
//                         final sum = total + deliveryCharge;
//                           return Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('   Order'),
//                               Text(
//                                 '      ₹${total.toStringAsFixed(1)}  ',
//                                 style: const TextStyle(
//                                   color: Colors.green,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 19,
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                         loading: () => const CircularProgressIndicator(),
//                         error: (error, stackTrace) =>
//                             const Text('Product Error'),
//                       );
//                     },
//                     loading: () => const CircularProgressIndicator(),
//                     error: (error, stackTrace) => const Text('Cart Error')),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("   delivery Charges"),
//                     Text(
//                       '${20}. 0    ',
//                       style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Text(' '),
//                 const CheckOut()
//               ]),
//         )
//       ]),
//       body: const Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 10,
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     CheckOutItems(),
//                     Divider(thickness: 1),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           " Shipping Address",
//                           style: TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.w700),
//                         ),
//                         AddressEditButton()
//                       ],
//                     ),
//                     AddressView(),
//                     Divider(thickness: 2),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/service/cart_total.dart';
import 'package:giltezy_2ndproject/widgets/checkout/address_edit_button.dart';
import 'package:giltezy_2ndproject/widgets/checkout/address_view.dart';
import 'package:giltezy_2ndproject/widgets/checkout/check_out_items_view.dart';
import 'package:giltezy_2ndproject/widgets/checkout/razorpay_view.dart';

class CheckOutPage extends ConsumerStatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CheckOutPage> createState() => _DataState();
}

class _DataState extends ConsumerState<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    final cartAsyncValue = ref.watch(cartContentsProvider);
    final productAsyncValue = ref.watch(productList);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      bottomSheet: Flex(
        direction: Axis.horizontal,
        children: [
          SizedBox(
            height: 200,
            width: 410,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartAsyncValue.when(
                  data: (cart) {
                    return productAsyncValue.when(
                      data: (productli) {
                        final total = CartTotal()
                            .calculateTotal(cartData: cart, product: productli);
                        const deliveryCharge = 20.0;
                        final sum = total + deliveryCharge;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '   Order',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '      ₹${total.toStringAsFixed(1)}  ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "   Delivery Charges",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '₹ $deliveryCharge    ',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  ' ₹ ${sum.toStringAsFixed(1)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                )
                              ],
                            ),
                          ],
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stackTrace) => const Text('Product Error'),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) => const Text('Cart Error'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                ),
                CheckOut(), // Uncomment this line if CheckOut is a valid widget
              ],
            ),
          )
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CheckOutItems(),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Address",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AddressEditButton(),
                      ],
                    ),
                    AddressView(),
                    Divider(thickness: 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
