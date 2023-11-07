// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/service/add_wishlist.dart';
import 'package:giltezy_2ndproject/service/proudcts.dart';
import 'package:giltezy_2ndproject/service/wishlist_data.dart';

import 'package:giltezy_2ndproject/utils/theme/colors.dart';
import 'package:giltezy_2ndproject/utils/theme/favorate_button.dart';

import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/item_view.dart';

import 'package:giltezy_2ndproject/widgets/cacheed_image.dart';
import 'package:page_transition/page_transition.dart';

class SecondGrid extends ConsumerStatefulWidget {
  final DocumentReference? reference;
  const SecondGrid({super.key, this.reference});

  @override
  // ignore: library_private_types_in_public_api
  _SecondGridState createState() => _SecondGridState();
}

class _SecondGridState extends ConsumerState<SecondGrid> {
  int selectedIndex = -1;
  bool isButtonPress = false;
  List<bool> isButtonPressList = List.generate(100, (index) => false);

  void buttonPressed(int index) {
    setState(() {
      for (int i = 0; i < isButtonPressList.length; i++) {
        if (i == index) {
          isButtonPressList[i] = true;
        } else {
          isButtonPressList[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final proudct = ref.watch(productList);

    return proudct.when(data: (productdata) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 0.75,
          ),
          scrollDirection: Axis.vertical,
          itemCount: productdata.length,
          itemBuilder: (context, index) {
            final document = productdata[index].data() as Map<String, dynamic>;

            final productName = document['p_name'];
            final productPrice = document['p_price'];
            final productImage = document['P-imageurl'];
            final productstock = document['stock'];
            // final reference = document[index].reference;
            final reference = productdata[index].reference;

            // ignore: non_constant_identifier_names
            final Productdescription = document['p_description'];

            final rowColor = rowColors[index % rowColors.length];
            final iconclr = IconsColors[index % IconsColors.length];
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                color: rowColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                elevation: 4,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),

                          child: FavorateButton(
                            ontap: () {
                              buttonPressed(index);
                              ShowSnackbar().showLoadingSnackbar(
                                  context, 'wishlist items added sucessfully');
                              ItemAdd()
                                  .addWishlistItem(reference)
                                  .whenComplete(() {
                                EasyLoading.dismiss();
                              });
                            },
                            isButtonTap: isButtonPressList[index],
                          ),
                          // child: InkWell(
                          //   child: Icon(Icons.favorite,
                          //       color: selectedIndex == index
                          //           ? Colors.red
                          //           : Colors.grey),
                          //   onTap: () {
                          //     setState(() {
                          //       if (selectedIndex == index) {
                          //         selectedIndex = -1;
                          //       } else {
                          //         selectedIndex = index;
                          //       }
                          //     });

                          //   },
                          // ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        CachedImage(
                          url: productImage,
                          height: 121.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                              fontSize: 19, color: Colors.black54),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          '₹$productPrice',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(children: [
                            Text(
                              "3.4",
                              style: TextStyle(
                                  fontSize: 12.863384246826172.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            )
                          ]),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: iconclr,
                              borderRadius: const BorderRadius.only(
                                  // bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10))),
                          height: 37.h,
                          width: 36.w,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: ItemViews(
                                          reference: reference,
                                          imageUrl: productImage,
                                          productDescription:
                                              Productdescription,
                                          productName: productName,
                                          productPrice: productPrice,
                                          stock: productstock,
                                        )));
                              },
                              child: const Icon(Icons.add)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    }, error: (error, stackTrace) {
      return const Center(child: Text('no data availble'));
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
