import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';
import 'package:giltezy_2ndproject/service/find_category.dart';
import 'package:giltezy_2ndproject/service/upload_image.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/image_picker.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_filed.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_price_field.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/proudct_description.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProductMangment extends StatefulWidget {
  const ProductMangment({super.key});

  @override
  State<ProductMangment> createState() => _ProductMangmentState();
}

class _ProductMangmentState extends State<ProductMangment> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController prouductnameController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  TextEditingController productdescriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final id = await findDocumentIdByCategory('Apple');
                        print('clicked');
                        if (_formkey.currentState!.validate()) {
                          await addData(
                                  description:
                                      productdescriptioncontroller.text,
                                  price: productpriceController.text,
                                  name: prouductnameController.text,
                                  imageurls: url!,
                                  id: 'dsff')
                              .whenComplete(() async {
                            print('completed');
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.success(
                                message: "category added sucessfully...",
                              ),
                            );

                            await Future.delayed(const Duration(seconds: 1));

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
                        'Save',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
