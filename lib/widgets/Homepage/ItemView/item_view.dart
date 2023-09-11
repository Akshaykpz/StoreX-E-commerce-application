import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/proudcts.dart';

class ItemViews extends StatefulWidget {
  final Product product;
  final String imageUrl;
  const ItemViews({super.key, required this.product, required this.imageUrl});

  @override
  State<ItemViews> createState() => _ItemViewsState();
}

class _ItemViewsState extends State<ItemViews> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: InteractiveViewer(
          maxScale: 5.0,
          minScale: 0.01,
          boundaryMargin: EdgeInsets.all(double.infinity),
          child: Column(
            children: [
              Text(widget.product.price),
              Text(widget.product.name),
              Center(
                  child: Image.network(
                widget.imageUrl,
              )),
            ],
          )),

      //   body: Column(
      // children: [
      //   // Expanded(
      //   //   child: HomePageviews(),
      //   // ),
      //   // const QuantiyPage(),
      //   Expanded(
      //       child: Stack(children: [
      //     // Positioned(
      //     //   top: 20,
      //     //   left: 20,
      //     //   child: Text(
      //     //     'Description',
      //     //     style: kvrheading,
      //     //   ),
      //     // ),
      //     const Positioned(
      //       top: 20,
      //       left: 20,
      //       child: Text(
      //         'SAMSUNG A -12',
      //         style: kvrheading,
      //       ),
      //     ),
      //     const Positioned(
      //       top: 80,
      //       left: 20,
      //       child: Text(
      //         'RAM -',
      //         style: kblacktext,
      //       ),
      //     ),
      //     Positioned(
      //         top: 68,
      //         left: 70,
      //         child: Chipadd(
      //           label: '4-GB',
      //           onChipTap: () {},
      //         )),
      //     Positioned(
      //         top: 68,
      //         left: 150,
      //         child: Chipadd(
      //           label: '6-GB',
      //           onChipTap: () {},
      //         )),
      //     Positioned(
      //         top: 68,
      //         left: 230,
      //         child: Chipadd(
      //           label: '8-GB',
      //           isSelected: true,
      //           onChipTap: () {},
      //         )),
      //     Positioned(
      //       top: 118,
      //       left: 20,
      //       child: SizedBox(
      //         width: MediaQuery.of(context).size.width -
      //             40, // Adjust the width as needed
      //         child: const Text(
      //           'Lorem Ithe industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five  into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      //           style: TextStyle(
      //             fontSize: 16, // Adjust the font size as needed
      //             color: Colors.black,
      //           ),
      //           textAlign: TextAlign.left, // Align the text to the left
      //         ),
      //       ),
      //     ),
      //   ])),
      //   Padding(
      //     padding: const EdgeInsets.only(bottom: 29),
      //     child: AnimatedButton(
      //       borderRadius: 29,
      //       onPress: () {},
      //       height: 50,
      //       width: 200,
      //       text: 'BUY NOW',
      //       gradient: const LinearGradient(colors: [Colors.red, Colors.purple]),
      //       selectedGradientColor: const LinearGradient(
      //           colors: [Colors.pinkAccent, Colors.purpleAccent]),
      //       isReverse: true,
      //       selectedTextColor: Colors.black,
      //       transitionType: TransitionType.LEFT_CENTER_ROUNDER,
      //       textStyle: const TextStyle(
      //           fontSize: 20,
      //           letterSpacing: 5,
      //           color: Colors.white,
      //           fontWeight: FontWeight.w400),
      //       borderColor: Colors.white,
      //       borderWidth: 1,
      //     ),
      //   ),

      bottomNavigationBar: BottomBarWithSheet(
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          decoration: BoxDecoration(color: Colors.white),
          itemIconColor: Colors.grey,
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.shopping_cart),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),

      // SingleChildScrollView(
      //     child: Column(
      //   children: [
      //     Container(
      //       width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(30),
      //           boxShadow: [
      //             BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(2))
      //           ]),
      //       child: Stack(children: <Widget>[]),
      //     )
      //   ],
      // )),
    );
  }
}
