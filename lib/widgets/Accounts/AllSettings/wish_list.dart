import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/test.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        // Call the addProduct function to add data
        addcategory(categoryimage: 'haii', categoryname: 'hello');
      },
      child: const Text('Add Product'),
    )));
  }
}
