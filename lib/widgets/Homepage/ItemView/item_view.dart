import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/chip.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/quantity_cart.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/slider_view.dart';

import 'cart_button.dart';

class ItemViews extends StatefulWidget {
  // final String id;
  // final String price;
  // final String img;
  // final String memory;
  // final String quality;

  const ItemViews({
    super.key,
    // required this.id,
    // required this.img,
    // required this.memory,
    // required this.price,
    // required this.quality
  });

  @override
  State<ItemViews> createState() => _ItemViewsState();
}

class _ItemViewsState extends State<ItemViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: HomePageviews(),
        ),
        QuantiyPage(),
        Expanded(
            child: Container(
          child: Stack(children: [
            // Positioned(
            //   top: 20,
            //   left: 20,
            //   child: Text(
            //     'Description',
            //     style: kvrheading,
            //   ),
            // ),
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                'SAMSUNG A -12',
                style: kvrheading,
              ),
            ),
            Positioned(
              top: 80,
              left: 20,
              child: Text(
                'RAM -',
                style: kblacktext,
              ),
            ),
            Positioned(
                top: 68,
                left: 70,
                child: Chipadd(
                  label: '4-GB',
                )),
            Positioned(
                top: 68,
                left: 150,
                child: Chipadd(
                  label: '6-GB',
                )),
            Positioned(
                top: 68,
                left: 230,
                child: Chipadd(
                  label: '8-GB',
                  isSelected: true,
                )),
            Positioned(
              top: 118,
              left: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width -
                    40, // Adjust the width as needed
                child: Text(
                  'Lorem Ithe industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five  into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  style: TextStyle(
                    fontSize: 16, // Adjust the font size as needed
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left, // Align the text to the left
                ),
              ),
            ),
          ]),
        )),
        Padding(
          padding: const EdgeInsets.only(bottom: 29),
          child: AnimatedButton(
            borderRadius: 29,
            onPress: () {},
            height: 50,
            width: 200,
            text: 'BUY NOW',
            gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
            selectedGradientColor: LinearGradient(
                colors: [Colors.pinkAccent, Colors.purpleAccent]),
            isReverse: true,
            selectedTextColor: Colors.black,
            transitionType: TransitionType.LEFT_CENTER_ROUNDER,
            textStyle: TextStyle(
                fontSize: 20,
                letterSpacing: 5,
                color: Colors.white,
                fontWeight: FontWeight.w400),
            borderColor: Colors.white,
            borderWidth: 1,
          ),
        )
      ],
    )

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
