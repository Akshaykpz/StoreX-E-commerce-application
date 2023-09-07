import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/image_picker.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_filed.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_price_field.dart';

class ProductMangment extends StatefulWidget {
  ProductMangment({super.key});

  @override
  State<ProductMangment> createState() => _ProductMangmentState();
}

class _ProductMangmentState extends State<ProductMangment> {
  TextEditingController prouductnameController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImagePickerWidget(),
            ProductFiled(namecontroller: prouductnameController),
            ProductPriceFiled(pricecontroller: productpriceController),
            ElevatedButton(
                onPressed: () async {
                  await addData(
                      price: productpriceController.text,
                      name: prouductnameController.text);
                },
                child: Text('add'))
          ],
        ),
      ),
    );
  }
}
