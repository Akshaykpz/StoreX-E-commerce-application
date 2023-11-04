import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/edit_user_profile.dart';

import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:giltezy_2ndproject/widgets/accounts/editprofile/edit_profile.dart';

import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfiles extends StatefulWidget {
  const EditProfiles({super.key});

  @override
  State<EditProfiles> createState() => _EditProfilesState();
}

final _nameController = TextEditingController();
final _phoneController = TextEditingController();
final _emailController = TextEditingController();
final _formkey = GlobalKey<FormState>();

class _EditProfilesState extends State<EditProfiles> {
  File? image;
  String? _imageUrl;

  Future<void> selectImageAndUpload() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });

      // Upload the selected image to Firebase Storage
      try {
        final Reference storageReference =
            firebase_storage.FirebaseStorage.instance.ref();
        final imageName = DateTime.now().millisecondsSinceEpoch.toString();
        // Upload the image to Firebase Storage
        final UploadTask uploadTask =
            storageReference.child('images/$imageName.jpg').putFile(image!);

        // Wait for the upload to complete and get the download URL
        final TaskSnapshot taskSnapshot = await uploadTask;
        if (taskSnapshot.state == firebase_storage.TaskState.success) {
          final String imageUrl = await taskSnapshot.ref.getDownloadURL();
          setState(() {
            _imageUrl = imageUrl;
          });
          print('Image uploaded successfully: $imageUrl');
        }
      } catch (error) {
        print('Error uploading image: $error');
      }
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
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(66.0)),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 4.0,
                      ),
                    ),
                    child: image != null
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70.0,
                            backgroundImage: FileImage(image!))
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
                bottom: 7,
                right: 3,
                child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: IconButton(
                        onPressed: () {
                          selectImageAndUpload();
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ))),
              )
            ]),
            EditProfile(
              validation: (value) {
                if (value!.isEmpty) {
                  return 'please enter name';
                }
                return null;
              },
              text: 'name',
              icons: const Icon(Icons.account_box),
              controller: _nameController,
            ),
            const SizedBox(
              height: 3,
            ),
            EditProfile(
              validation: (value) {
                if (value!.isEmpty) {
                  return 'please enter email';
                }
                return null;
              },
              controller: _emailController,
              text: 'email',
              icons: const Icon(Icons.email),
            ),
            EditProfile(
              validation: (value) {
                if (value!.isEmpty) {
                  return 'please enter phone';
                }
                return null;
              },
              controller: _phoneController,
              text: 'phone',
              icons: const Icon(Icons.phone),
            ),
            SizedBox(
              height: 14,
            ),
            SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () async {
                    print(_imageUrl);
                    if (_formkey.currentState!.validate() && image != null) {
                      await adduserProfile(
                          imagurl: _imageUrl.toString(),
                          email: _emailController.text,
                          name: _nameController.text,
                          phone: _phoneController.text);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                    // Elevation of the button
                  ),
                  child: const Text('DONE'),
                ))
          ]),
        ),
      ),
    );
  }
}
