import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

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
                  return GridView.builder(
                    itemCount: cart.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final cartProvider =
                          cart[index].data() as Map<String, dynamic>;
                      final reference = cartProvider['product_reference']
                          as DocumentReference;

                      // final productData = productli[index].data();

                      final matchProduct = productli.firstWhere((element) {
                        return element.reference == reference;
                      });
                      final productName = matchProduct['p_name'];
                      final cartPrice = matchProduct['p_price'];
                      final cartImage = matchProduct['P-imageurl'];

                      return Column(
                        children: [
                          Text(productName),
                          // Display other cart item details here as needed.
                        ],
                      );
                    },
                  );
                },
                error: (error, stackTrace) => CircularProgressIndicator(),
                loading: () => CircularProgressIndicator()));
      },
      error: (error, stackTrace) => CircularProgressIndicator(),
      loading: () => CircularProgressIndicator(),
    );

    // ),
  }
}
