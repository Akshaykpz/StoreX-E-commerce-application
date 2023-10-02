import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';

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
                  return ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final cartProvider =
                          cart[index].data() as Map<String, dynamic>;
                      final reference = cartProvider['product_reference']
                          as DocumentReference;

                      final matchProduct = productli.firstWhere((element) {
                        return element.reference == reference;
                      });
                      final productName = matchProduct['p_name'];
                      final cartPrice = matchProduct['p_price'];
                      final cartImage = matchProduct['P-imageurl'];

                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(width: 0.7)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Image.network(cartImage),
                            Text(productName),
                            Text(cartPrice)
                          ],
                        ),
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
