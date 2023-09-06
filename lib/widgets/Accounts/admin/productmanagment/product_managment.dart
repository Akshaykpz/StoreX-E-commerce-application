import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/image_picker.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_filed.dart';

class ProductMangment extends StatelessWidget {
  const ProductMangment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ImagePickerWidget(),
            ProductFiled(),
            ProductFiled(),
            ProductFiled()
          ],
        ),
      ),
    );
  }
}
