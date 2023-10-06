import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/controller/provider_auth-wishlist.dart';

class WishList extends ConsumerStatefulWidget {
  const WishList({super.key});

  @override
  ConsumerState<WishList> createState() => _WishListState();
}

class _WishListState extends ConsumerState<WishList> {
  @override
  Widget build(BuildContext context) {
    final wishlistData = ref.watch(wishlistContentsProvider);
    final product = ref.watch(productList);
    return wishlistData.when(
      data: (wishlist) {
        return Scaffold(
          body: product.when(
            data: (prouctlis) {
              return ListView.builder(
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  final wishlistProvider =
                      wishlist[index].data() as Map<String, dynamic>;
                  final referenc =
                      wishlistProvider['product_referce'] as DocumentReference?;

                  final matchproduct = prouctlis.firstWhere((element) {
                    return element.reference == referenc;
                  });
                  final productName = matchproduct['p_name'];
                  final wishListPrice = matchproduct['p_price'];
                  final wishListImage = matchproduct['P-imageurl'];

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
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
                              wishListImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            children: [
                              Text(productName,
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              Text(wishListPrice,
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                          PopupMenuButton(
                            itemBuilder: (context) =>
                                [_buildPopupMenuItem('delete')],
                          )
                        ],
                      ),
                    ),
                  );

                  // Handle the case where 'product_reference' is null

                  // Handle the case where 'product_reference' is null
                },
              );
            },
            error: (error, stackTrace) =>
                Center(child: CircularProgressIndicator()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        );
      },
      error: (error, stackTrace) => Center(child: CircularProgressIndicator()),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }

  PopupMenuItem _buildPopupMenuItem(String title) {
    return PopupMenuItem(
      child: Text(title),
    );
  }
}
