import 'package:flutter/material.dart';

import '../editprofile/edit_profile.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        EditProfile(text: 'name'),
        const SizedBox(
          height: 3,
        ),
        EditProfile(text: 'address'),
        EditProfile(
          text: 'phone',
        ),
        EditProfile(
          text: 'District',
        ),
        EditProfile(
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
