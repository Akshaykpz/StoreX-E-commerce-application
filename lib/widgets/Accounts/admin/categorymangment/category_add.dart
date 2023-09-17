import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/test.dart';

import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/image_picker.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_filed.dart';

// ignore: must_be_immutable
class CategoryAdd extends StatefulWidget {
  CategoryAdd({super.key});

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  TextEditingController categorynamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            ImagePickerWidget(),
            ProductFiled(
              namecontroller: categorynamecontroller,
              label: 'category item',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await addcategory(
                        categoryname: categorynamecontroller.text,
                        categoryimage: '');

                    // ignore: use_build_context_synchronously
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      text: "Your transaction was successful",
                    );
                  } catch (e) {
                    print("Error: $e");

                    // ignore: use_build_context_synchronously
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: "An error occurred while saving",
                    );
                  }
                  Navigator.pop(context);
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
        ));
  }
}
