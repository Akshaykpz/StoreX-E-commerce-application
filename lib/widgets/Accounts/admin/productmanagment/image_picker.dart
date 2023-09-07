import 'dart:io';

import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/upload_image.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/buttons.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? pickedImage;

  Future<void> getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    } else {
      // User canceled the image picking.
    }
  }

  void removeImage(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  pickedImage != null
                      ? Image.file(
                          pickedImage!,
                        )
                      : Container(),
                  // IconButton(
                  //     onPressed: () {}, icon: Icon(Icons.cancel_outlined)),
                ],
              ),
              width: 180,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 8,
                    blurRadius: 10,
                    offset: Offset(10, 10), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    spreadRadius: 8,
                    blurRadius: 10,
                    offset: Offset(-10, -10), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 38,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImagePickerButton(
              iconss: Icons.add_a_photo,
              isloggingin: true,
              onpress: () {
                getImageFromGallery();
              },
              title: 'Pick Image',
            ),
            ImagePickerButton(
              iconss: Icons.upload_file,
              isloggingin: true,
              title: 'Upload Image',
              onpress: () {
                UploadImage().uploadImageToFirebase(pickedImage);
              },
            ),
          ],
        )

        // Your other widgets here
      ],
    );
  }
}
