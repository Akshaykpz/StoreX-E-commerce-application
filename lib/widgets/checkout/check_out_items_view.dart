import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';

class CheckOutItems extends ConsumerStatefulWidget {
  const CheckOutItems({super.key});

  @override
  ConsumerState<CheckOutItems> createState() => _CheckOutItemsState();
}

class _CheckOutItemsState extends ConsumerState<CheckOutItems> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartContentsProvider);
    final product = ref.watch(productList);
    return product.when(
      data: (productdata) {
        return Column(
          children: [
            cartData.when(
              data: (cartdataitem) {
                return Column(
                  children: List.generate(cartdataitem.length, (index) {
                    final checkout =
                        cartdataitem[index].data() as Map<String, dynamic>;
                    final reference =
                        checkout['product_reference'] as DocumentReference;
                    final data = checkout['itemCount'].toString();

                    final matchProduct = productdata.firstWhere((element) {
                      return element.reference == reference;
                    });
                    final productName = matchProduct['p_name'];
                    final cartPrice = matchProduct['p_price'];
                    final cartImage = matchProduct['P-imageurl'];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            height: 130,
                            width: 380,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(width: 1.5, color: Colors.teal)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.network(
                                      cartImage,
                                      height: 90,
                                      width: 100,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          productName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          cartPrice,
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 0.8)),
                                      height: 22,
                                      width: 55,
                                      child: Text(
                                        " Qty - $data",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                );
              },
              error: (error, stackTrace) {
                return const Text("Data error");
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return const Text("Product data error");
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
