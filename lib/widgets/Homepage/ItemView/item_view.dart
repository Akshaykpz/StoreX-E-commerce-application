import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/service/add_wishlist.dart';
import 'package:giltezy_2ndproject/service/wishlist_data.dart';

import 'package:giltezy_2ndproject/widgets/cacheed_image.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/buy_button.dart';

import 'package:readmore/readmore.dart';

class ItemViews extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;

  final String productPrice;
  final String? stock;
  final String productDescription;
  final DocumentReference reference;

  const ItemViews({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.reference,
    this.stock,
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
    int intValue = int.parse(widget.stock.toString());
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
            ShowSnackbar()
                .showLoadingSnackbar(context, 'cart items added sucessfully');
            ItemAdd().addCart(widget.reference).whenComplete(() {
              EasyLoading.dismiss();
            });
          } else if (index == 1) {
            ShowSnackbar().showLoadingSnackbar(
                context, 'wishlist items added sucessfully');
            ItemAdd().addWishlistItem(widget.reference).whenComplete(() {
              EasyLoading.dismiss();
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
                          Text(" price ₹${widget.productPrice} ",
                              style: TextStyle(
                                  fontSize: 21.519121170043945.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red)),
                          SizedBox(
                            width: 100.w,
                          ),
                          (intValue != 0)
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 5, color: Colors.white)
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green),
                                  child: const Text("On Stock",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.white)),
                                )
                              : const Text("No Stock",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.red))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Row(children: [
                          Text(
                            "3.4",
                            style: TextStyle(
                              fontSize: 15.863384246826172.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        ]),
                      ),
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
                      ReadMoreText(
                        widget.productDescription,
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        style: const TextStyle(color: Colors.white),
                        trimExpandedText: 'Show less',
                        moreStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      CartButton(
                        imageUrl: widget.imageUrl,
                        productDescription: widget.productDescription,
                        productName: widget.productName,
                        productPrice: widget.productPrice,
                        reference: widget.reference,
                      )
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
                    child: CachedImage(
                      url: widget.imageUrl,
                      height: 550,
                    ),
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
  EasyLoading.show(
    status: 'loading...',
    dismissOnTap: false,
  );
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
