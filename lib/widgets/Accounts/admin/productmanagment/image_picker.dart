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
          decoration: BoxDecoration(border: Border.all()),
          width: MediaQuery.of(context).size.width * 0.7,
          height: 200,
          child: Stack(
            children: [
              pickedImage != null ? Image.file(pickedImage!) : Container(),
              IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined)),
            ],
          ),
        ),
        ImagePickerButton(
          isloggingin: true,
          onpress: () {
            getImageFromGallery();
          },
          title: 'haiiii',
        ),
        const SizedBox(
          height: 20,
        ),
        ImagePickerButton(
          isloggingin: true,
          title: 'helllo',
          onpress: () {
            UploadImage().uploadImageToFirebase(pickedImage);
          },
        ),

        // Your other widgets here
      ],
    );
  }
}
