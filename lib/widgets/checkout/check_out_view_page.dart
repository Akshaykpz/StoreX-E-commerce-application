import 'package:cloud_firestore/cloud_firestore.dart';
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
                productAsyncValue.when(
                  data: (productli) {
                    return cartAsyncValue.when(
                      data: (cart) {
                        final total = CartTotal()
                            .calculateTotal(cartData: cart, product: productli);
                        const deliveryCharge = 20.0;
                        final sum = total + deliveryCharge;

                        return Column(
                            children: List.generate(
                          cart.length,
                          (index) {
                            final checkout =
                                cart[index].data() as Map<String, dynamic>;
                            final reference = checkout['product_reference']
                                as DocumentReference;

                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    const SizedBox(
                                      width: 6,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                CheckOut(productReference: reference),
                              ],
                            );
                          },
                        ));
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stackTrace) => const Text('Product Error'),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) => const Text('Cart Error'),
                ),
                // Uncomment this line if CheckOut is a valid widget
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
