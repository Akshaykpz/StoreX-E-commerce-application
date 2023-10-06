import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';

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
        return Scaffold(
          body: product.when(
              data: (productli) {
                return ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final cartProvider =
                        cart[index].data() as Map<String, dynamic>;
                    final reference =
                        cartProvider['product_reference'] as DocumentReference;

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
                                onPressed: (context) {},
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
                                ),
                              ),
                              Column(
                                children: [
                                  Text(productName,
                                      style: TextStyle(
                                        fontSize: 18,
                                      )),
                                  Text(cartPrice,
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                              const CounterApp(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => const CircularProgressIndicator(),
              loading: () => const CircularProgressIndicator()),
          bottomSheet: Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              height: 129,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Text(
                      'Shipping Cost- ',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Total-",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const BuyButton()
                ],
              )),
        );
      },
      error: (error, stackTrace) => const CircularProgressIndicator(),
      loading: () => const CircularProgressIndicator(),
    );

    // ),
  }
}
