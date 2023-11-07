import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/service/add_wishlist.dart';
import 'package:giltezy_2ndproject/service/cart_total.dart';
import 'package:giltezy_2ndproject/service/delete_data.dart';

import 'package:giltezy_2ndproject/widgets/cart/button.dart';
import 'package:giltezy_2ndproject/widgets/cart/item_counter.dart';

class Cart extends ConsumerStatefulWidget {
  final String? cartId;
  const Cart({super.key, this.cartId});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartContentsProvider);
    final product = ref.watch(productList);

    return cartData.when(
      data: (cart) {
        return SafeArea(
          child: product.when(
              data: (productli) {
                return Scaffold(
                  bottomSheet: Container(
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12))),
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total Amount",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '₹${CartTotal().calculateTotal(cartData: cart, product: productli).toStringAsFixed(1)}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                ),
                              ),
                              const BuyButton()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final cartProvider =
                          cart[index].data() as Map<String, dynamic>;
                      final reference = cartProvider['product_reference']
                          as DocumentReference;
                      final docid = cart[index].id;

                      final matchProduct = productli.firstWhere((element) {
                        return element.reference == reference;
                      });
                      final productName = matchProduct['p_name'];
                      final cartPrice = matchProduct['p_price'];
                      final cartImage = matchProduct['P-imageurl'];

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                  backgroundColor: Colors.red,
                                  onPressed: (context) {
                                    ShowSnackbar()
                                        .showsnackbar(context, ' item removed');
                                    deleteCart(reference).whenComplete(
                                      () {
                                        EasyLoading.dismiss();
                                      },
                                    );
                                  },
                                  icon: Icons.delete),
                            ],
                          ),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: const BorderSide(width: 0.5)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  child: Image.network(
                                    cartImage,
                                    fit: BoxFit.cover,
                                    height: 80,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(productName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('₹$cartPrice',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                                CounterApp(Id: docid),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (error, stackTrace) => const CircularProgressIndicator(),
              loading: () => const CircularProgressIndicator()),
        );
      },
      error: (error, stackTrace) => const CircularProgressIndicator(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
