import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/category_item_add.dart';
import 'package:giltezy_2ndproject/service/upload_image.dart';
import 'package:giltezy_2ndproject/widgets/admin/productmanagment/image_picker.dart';
import 'package:giltezy_2ndproject/widgets/admin/productmanagment/product_filed.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// ignore: must_be_immutable
class CategoryAdd extends StatefulWidget {
  const CategoryAdd({super.key});

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  TextEditingController categorynamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 22,
            ),
            const ImagePickerWidget(),
            ProductFiled(
              namecontroller: categorynamecontroller,
              label: 'category item',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () async {
                  log('addall');
                  try {
                    await addcategory(
                      categoryname: categorynamecontroller.text,
                      categoryimage: url.toString(),
                    );
                    showTopSnackBar(
                      // ignore: use_build_context_synchronously
                      Overlay.of(context),
                      const CustomSnackBar.success(
                        message: "category added sucessfully...",
                      ),
                    );

                    await Future.delayed(const Duration(seconds: 2));

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  } catch (e) {
                    print("Error: $e");

                    showTopSnackBar(
                      // ignore: use_build_context_synchronously
                      Overlay.of(context),
                      const CustomSnackBar.error(
                        message: "Something went wrong....",
                      ),
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
    ));
  }
}
