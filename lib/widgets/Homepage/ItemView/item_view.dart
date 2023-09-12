import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';

import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/proudcts.dart';
import 'package:google_fonts/google_fonts.dart';

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
          boundaryMargin: const EdgeInsets.all(double.infinity),
          child: Column(
            children: [
              Center(
                  child: Image.network(
                widget.imageUrl,
              )),
            ],
          )),

      bottomNavigationBar: BottomBarWithSheet(
        curve: Curves.decelerate,
        controller: _bottomBarController,
        bottomBarTheme: const BottomBarTheme(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.vertical(top: Radius.circular(27))),
          itemIconColor: Colors.red,
        ),
        items: const [
          BottomBarWithSheetItem(icon: Icons.shopping_cart),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
        sheetChild:
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Padding(padding: EdgeInsets.all(12)),
          SingleChildScrollView(
            child: Column(
              children: [
                Text(widget.product.name,
                    style: GoogleFonts.anekDevanagari(
                        fontSize: 22, color: Colors.black)),
                Text(widget.product.price,
                    style: GoogleFonts.anekDevanagari(
                        fontSize: 16, color: Colors.black)),
                const Text("data")
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("haii"))
        ]),
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
