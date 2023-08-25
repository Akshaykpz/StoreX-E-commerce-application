import 'package:flutter/material.dart';

import '../../../utils/theme/textstyle.dart';
import '../editprofile/edit_profile.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 120,
          child: Center(
            child: Text(
              'Shipping Address',
              style: kvrheading,
            ),
          ),
        ),
        const EditProfile(text: 'name'),
        const SizedBox(
          height: 3,
        ),
        const EditProfile(text: 'address'),
        const EditProfile(
          text: 'phone',
        ),
        const EditProfile(
          text: 'District',
        ),
        const EditProfile(
          text: 'state',
        ),
        SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal, // Text color
                textStyle: const TextStyle(fontSize: 16), // Text style
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Button border radius
                ),
                elevation: 4, // Elevation of the button
              ),
              child: const Text('DONE'),
            ))
      ]),
    );
  }
}
