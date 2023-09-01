import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/profile_data.dart';

import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:giltezy_2ndproject/widgets/accounts/editprofile/edit_profile.dart';
import 'package:giltezy_2ndproject/widgets/accounts/editprofile/image_picker.dart';
import 'package:image_picker/image_picker.dart';

class EditProfiles extends StatefulWidget {
  const EditProfiles({super.key});

  @override
  State<EditProfiles> createState() => _EditProfilesState();
}

class _EditProfilesState extends State<EditProfiles> {
  Uint8List? image;

  void selectimage() async {
    Uint8List img = await pickimage(ImageSource.gallery);
    log('Selected image bytes: ${img.lengthInBytes}');
    setState(() {
      image = img;
    });
  }

  Future<void> upload() async {
    if (image != null) {
      try {
        String imageUrl =
            await StoreData().uploadImage('profileimage.jpg', image!);
        await StoreData()
            .savedata(imageUrl: imageUrl); // Make sure to use imageUrl

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Image uploaded successfully'),
        ));

        setState(() {
          image = null; // Clear the image after upload
        });

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (error) {
        log('Error uploading image: $error');
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error uploading image'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select an image first'),
      ));
    }
  }

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
                    borderRadius: const BorderRadius.all(Radius.circular(66.0)),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 4.0,
                    ),
                  ),
                  child: image != null
                      ? CircleAvatar(
                          radius: 70.0,
                          backgroundImage: MemoryImage(image!),
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('assets/images/reallogo.png'),
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
                      onPressed: () {
                        selectimage();
                      },
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
                onPressed: () {
                  upload();
                  Navigator.pop(context);
                },
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
