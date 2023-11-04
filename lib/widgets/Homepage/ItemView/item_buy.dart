import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/widgets/checkout/address_edit_button.dart';
import 'package:giltezy_2ndproject/widgets/checkout/address_view.dart';
import 'package:giltezy_2ndproject/widgets/checkout/razorpay_view.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/item_view.dart';

class ItemBuypage extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;

  final String productPrice;
  final String? stock;
  final String productDescription;
  final DocumentReference reference;
  const ItemBuypage(this.imageUrl, this.productName, this.productPrice,
      this.stock, this.productDescription, this.reference,
      {super.key});

  @override
  ConsumerState<ItemBuypage> createState() => _ItemBuypageState();
}

class _ItemBuypageState extends ConsumerState<ItemBuypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 130,
              width: 400,

              // color: Colors.red,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black45),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      widget.imageUrl,
                      height: 100,
                    ),
                    Text(widget.productName),
                    Text(widget.productPrice),
                  ]),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
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
            const AddressView(),
            const Divider(thickness: 2),
            Container(
              child: const Text(""),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: CheckOut(),
      ),
    );
  }
}
