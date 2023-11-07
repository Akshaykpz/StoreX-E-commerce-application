import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/accounts/order/order_detiles.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Order Status",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          OrderDetiles(
              isfrist: true,
              islast: false,
              ispast: true,
              texts: 'Ordered today'),
          OrderDetiles(
              isfrist: false, islast: false, ispast: true, texts: 'Shipped'),
          OrderDetiles(
              isfrist: false, islast: true, ispast: false, texts: 'deliveed'),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "View Order Details",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
