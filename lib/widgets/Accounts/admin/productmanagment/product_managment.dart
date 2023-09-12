import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/image_picker.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_filed.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_price_field.dart';

class ProductMangment extends StatefulWidget {
  const ProductMangment({super.key});

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
            const ImagePickerWidget(),
            ProductFiled(
                namecontroller: prouductnameController, label: 'product name'),
            ProductPriceFiled(
                pricecontroller: productpriceController,
                label: 'product price'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () async {
                  await addData(
                      price: productpriceController.text,
                      name: prouductnameController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
