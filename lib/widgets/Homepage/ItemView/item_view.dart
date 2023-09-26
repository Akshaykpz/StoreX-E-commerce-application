// import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';

// import 'package:flutter/material.dart';
// import 'package:giltezy_2ndproject/service/proudcts.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ItemViews extends StatefulWidget {
//   final Product product;
//   final String imageUrl;
//   const ItemViews({super.key, required this.product, required this.imageUrl});

//   @override
//   State<ItemViews> createState() => _ItemViewsState();
// }

// class _ItemViewsState extends State<ItemViews> {
//   final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);

//   @override
//   void initState() {
//     _bottomBarController.openSheet();
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: InteractiveViewer(
//           maxScale: 5.0,
//           minScale: 0.01,
//           boundaryMargin: const EdgeInsets.all(double.infinity),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [

//                    Image.network(
//                   widget.imageUrl,
//                 ),
//               ],
//             ),
//           )),

//       bottomNavigationBar: BottomBarWithSheet(
//         curve: Curves.decelerate,
//         controller: _bottomBarController,
//         bottomBarTheme: const BottomBarTheme(
//           mainButtonPosition: MainButtonPosition.middle,
//           decoration: BoxDecoration(
//               color: Colors.black12,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(27))),
//           itemIconColor: Colors.red,
//         ),
//         items: const [
//           BottomBarWithSheetItem(icon: Icons.shopping_cart),
//           BottomBarWithSheetItem(icon: Icons.favorite),
//         ],
//         sheetChild:
//             Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//           const Padding(padding: EdgeInsets.all(12)),
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Text(widget.product.name,
//                     style: GoogleFonts.cairoPlay(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 29,
//                         color: Colors.blueAccent)),
//                 // Text(widget.product.price,
//                 //     style: GoogleFonts.anekDevanagari(
//                 //         fontSize: 16, color: Colors.black)),
//                 Text(widget.product.description.toString())
//               ],
//             ),
//           ),
//           ElevatedButton(onPressed: () {}, child: const Text("haii"))
//         ]),
//       ),

//       // SingleChildScrollView(
//       //     child: Column(
//       //   children: [
//       //     Container(
//       //       width: MediaQuery.of(context).size.width,
//       //       decoration: BoxDecoration(
//       //           borderRadius: BorderRadius.circular(30),
//       //           boxShadow: [
//       //             BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(2))
//       //           ]),
//       //       child: Stack(children: <Widget>[]),
//       //     )
//       //   ],
//       // )),
//     );
//   }
// }
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/service/proudcts.dart';
import 'package:giltezy_2ndproject/widgets/cacheed_image.dart';
import 'package:giltezy_2ndproject/widgets/cart/button.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/cart_button.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/star_rating.dart';

class ItemViews extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;

  final String productPrice;

  final String productDescription;

  const ItemViews({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
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
                      StarRating(),
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
                      CartButton()
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
