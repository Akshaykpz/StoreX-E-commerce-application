import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';
import 'package:giltezy_2ndproject/service/find_category.dart';
import 'package:giltezy_2ndproject/service/upload_image.dart';

import 'package:giltezy_2ndproject/widgets/admin/productmanagment/image_picker.dart';
import 'package:giltezy_2ndproject/widgets/admin/productmanagment/product_filed.dart';
import 'package:giltezy_2ndproject/widgets/admin/productmanagment/product_price_field.dart';
import 'package:giltezy_2ndproject/widgets/admin/productmanagment/proudct_description.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UpdateProduct extends StatefulWidget {
  final String name;
  final String price;
  final String description;
  final String stock;
  final String category;
  final String image;
  const UpdateProduct(
      {super.key,
      required this.name,
      required this.price,
      required this.description,
      required this.stock,
      required this.category,
      required this.image});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController prouductnameController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  TextEditingController productdescriptioncontroller = TextEditingController();
  TextEditingController categoryproudctController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController image = TextEditingController();

  @override
  Widget build(BuildContext context) {
    prouductnameController.text = widget.name;
    productpriceController.text = widget.price;
    productdescriptioncontroller.text = widget.description;
    stockController.text = widget.stock;
    categoryproudctController.text = widget.category;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 19,
                ),
                const ImagePickerWidget(),
                ProductFiled(
                    namecontroller: prouductnameController,
                    label: 'product name'),
                ProductPriceFiled(
                    pricecontroller: productpriceController,
                    label: 'product price'),
                Productdescription(
                    description: productdescriptioncontroller,
                    label: 'description'),
                ProductFiled(
                    namecontroller: categoryproudctController,
                    label: 'category name'),
                ProductFiled(namecontroller: stockController, label: 'stock'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        print('clicked');
                        if (_formkey.currentState!.validate()) {
                          await addData(
                                  categoryname: categoryproudctController.text,
                                  description:
                                      productdescriptioncontroller.text,
                                  price: productpriceController.text,
                                  name: prouductnameController.text,
                                  imageurls: url!,
                                  stock: stockController.text)
                              .whenComplete(() async {
                            print('completed');
                            print(" this is my stock${stockController.text}");
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.success(
                                message: "category added sucessfully...",
                              ),
                            );

                            await Future.delayed(const Duration(seconds: 1));

                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          });
                        }
                      } catch (e) {
                        print("Error: $e");

                        // ignore: use_build_context_synchronously
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text: "An error occurred while saving",
                        );
                      }
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
                        'Update',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
