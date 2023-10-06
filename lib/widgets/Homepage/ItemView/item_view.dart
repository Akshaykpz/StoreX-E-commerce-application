import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/service/wishlist_data.dart';

import 'package:giltezy_2ndproject/widgets/cacheed_image.dart';

import 'package:giltezy_2ndproject/widgets/homepage/ItemView/cart_button.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/star_rating.dart';

class ItemViews extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;

  final String productPrice;

  final String productDescription;
  final DocumentReference reference;

  const ItemViews({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.reference,
    required this.productDescription,
  });

  @override
  ConsumerState<ItemViews> createState() => _ItemOnClickState();
}

class _ItemOnClickState extends ConsumerState<ItemViews> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: -1);

  @override
  void initState() {
    _bottomBarController.openSheet();
    super.initState();
  }

  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarWithSheet(
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          // mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(50, 52, 59, 1),
                  Color.fromRGBO(72, 76, 87, 1),
                  Color.fromRGBO(29, 31, 35, 1),
                ],
              )),
          selectedItemIconColor: Colors.white,
          itemIconColor: Colors.grey,
          itemTextStyle: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
          ),
          selectedItemTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: 10.0,
          ),
        ),
        onSelectItem: (index) async {
          if (index == 0) {
            await ItemAdd().addCart(widget.reference).whenComplete(() {
              _showLoadingSnackbar(context, 'cart item added sucessfully');
            });
          } else if (index == 1) {
            await ItemAdd().addWishlistItem(widget.reference).whenComplete(() {
              _showLoadingSnackbar(context, 'wishlist items added sucessfully');
            });
          }
        },
        // onSelectItem: (index) async {
        //   if (index == 0) {
        //     return product.addToCart(widget.docId).whenComplete(() {});
        //   } else if (index == 1) {
        //     EasyLoading.show(
        //         indicator: loading(), maskType: EasyLoadingMaskType.clear);
        //     return product.addToWishList(widget.docId).whenComplete(() {
        //       EasyLoading.dismiss();
        //     });
        //   }
        // },
        sheetChild: SizedBox(
          height: 300.h,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.productName,
                          style: TextStyle(
                              fontSize: 27.519121170043945.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      Row(
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          Text("price ₹ ${widget.productPrice}",
                              style: TextStyle(
                                  fontSize: 21.519121170043945.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red)),
                          SizedBox(
                            width: 150.w,
                          ),
                        ],
                      ),
                      const StarRating(),
                      SizedBox(
                        height: 10.w,
                      ),
                      Text(
                        'description',
                        style: TextStyle(
                          fontSize: 15.863384246826172.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.productDescription,
                        style: TextStyle(
                          fontSize: 12.863384246826172.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      const CartButton()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        items: const [
          BottomBarWithSheetItem(
            icon: Icons.shopping_cart,
          ),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InteractiveViewer(
                  child: Center(
                    child: CachedImage(url: widget.imageUrl, height: 330),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showLoadingSnackbar(BuildContext context, String text) {
  EasyLoading.show(status: 'Loading...');
  ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 1),
        ),
      )
      .closed
      .then((reason) {
    EasyLoading.dismiss();
  });
}
