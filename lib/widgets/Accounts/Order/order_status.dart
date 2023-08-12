import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/Order/order_detiles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Order Details',
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: ListView(
            children: const [
              OrderDetiles(
                  isfrist: true,
                  islast: false,
                  ispast: true,
                  texts: 'ORDER PLACED'),
              OrderDetiles(
                  isfrist: false,
                  islast: false,
                  ispast: false,
                  texts: 'ORDER PLACED'),
              OrderDetiles(
                isfrist: false,
                islast: true,
                ispast: true,
                texts: 'ORDER DELIVERD',
              )
            ],
          ),
        ));
  }
}
