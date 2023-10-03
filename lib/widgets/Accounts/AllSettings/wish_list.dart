import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                  final referenc = wishlistProvider['product_reference']
                      as DocumentReference?;

                  if (referenc != null) {
                    final matchproduct = prouctlis.firstWhere((element) {
                      return element.reference == referenc;
                    });
                    final productName = matchproduct['p_name'];
                    final wishListPrice = matchproduct['p_price'];
                    final wishListImage = matchproduct['P-imageurl'];

                    return Center(
                      child: Column(
                        children: [Text(productName), Text(wishListPrice)],
                      ),
                    );
                  } else {
                    // Handle the case where 'product_reference' is null
                    return const Center(
                      child: Text(
                          "Product reference is null for this wishlist item"),
                    );
                  }

                  // Handle the case where 'product_reference' is null
                },
              );
            },
            error: (error, stackTrace) => CircularProgressIndicator(),
            loading: () => CircularProgressIndicator(),
          ),
        );
      },
      error: (error, stackTrace) => CircularProgressIndicator(),
      loading: () => CircularProgressIndicator(),
    );
  }
}
