import 'package:flutter/material.dart';

import '../../../utils/theme/textstyle.dart';
import '../Editprofile/edit_profile.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          child: Center(
            child: Text(
              'Shipping Address',
              style: kvrheading,
            ),
          ),
          height: 120,
        ),
        EditProfile(text: 'name'),
        SizedBox(
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
        Container(
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('DONE'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Background color
                onPrimary: Colors.white, // Text color
                textStyle: TextStyle(fontSize: 16), // Text style
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Button border radius
                ),
                elevation: 4, // Elevation of the button
              ),
            ))
      ]),
    );
  }
}
