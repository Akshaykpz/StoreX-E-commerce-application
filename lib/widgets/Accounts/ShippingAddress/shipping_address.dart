import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/address_add_firebase.dart';

import '../editprofile/edit_profile.dart';

class ShippingAddress extends StatefulWidget {
  ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController districtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            EditProfile(
              text: 'name',
              controller: nameController,
              validation: (value) {
                if (value!.isEmpty) {
                  return 'please enter name';
                }
                return null;
              },
            ),
            EditProfile(
              text: 'address',
              controller: addressController,
              validation: (value) {
                if (value!.isEmpty) {
                  return 'please enter address';
                }
                return null;
              },
            ),
            EditProfile(
              controller: phoneController,
              validation: (value) {
                if (value!.isEmpty) {
                  return 'please enter phone';
                }
                return null;
              },
              text: 'phone',
            ),
            EditProfile(
              controller: pincodeController,
              text: 'pincode',
              validation: (value) {
                if (value!.isEmpty) {
                  return 'please enter pincode';
                }
                return null;
              },
            ),
            EditProfile(
              controller: districtController,
              text: 'District',
              validation: (value) {
                if (value!.isEmpty) {
                  return 'please enter district ';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await addAddress(
                          name: nameController.text,
                          address: addressController.text,
                          phone: phoneController.text,
                          pincode: pincodeController.text,
                          district: districtController.text);
                      print('adddress added sucesssfully');
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange, // Text color
                    textStyle: const TextStyle(fontSize: 16), // Text style
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Button border radius
                    ),
                    elevation: 4, // Elevation of the button
                  ),
                  child: const Text(
                    'Save Address',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
