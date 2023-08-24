import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/Editprofile/edit_profile.dart';

class EditProfiles extends StatelessWidget {
  const EditProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 70,
            child: Center(
              child: Text(
                'Profile',
                style: kvrheading,
              ),
            ),
          ),
          Stack(children: [
            SizedBox(
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 4.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/reallogo.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 19,
              child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ))),
            )
          ]),
          const EditProfile(text: 'name', icons: Icon(Icons.account_box)),
          const SizedBox(
            height: 3,
          ),
          const EditProfile(
            text: 'email',
            icons: Icon(Icons.email),
          ),
          const EditProfile(
            text: 'phone',
            icons: Icon(Icons.phone),
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
      ),
    );
  }
}
