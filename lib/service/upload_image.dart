import 'dart:io';
import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

String? url;

class UploadImage {
  File? images;

  Future<void> uploadImageToFirebase(File? imageFile) async {
    try {
      if (imageFile == null) {
        log('Image file is null');
        return;
      }

      final storageReference = firebase_storage.FirebaseStorage.instance.ref();
      final imageName = DateTime.now().millisecondsSinceEpoch.toString();

      final uploadTask =
          storageReference.child('images/$imageName.jpg').putFile(imageFile);

      final snapshot = await uploadTask;

      if (snapshot.state == firebase_storage.TaskState.success) {
        final imageUrl = await snapshot.ref.getDownloadURL();
        url = imageUrl;
        print(url);
        log("Download URL: $imageUrl");
      } else {
        log("Image upload task is not in success state.");
      }
      return;
    } catch (error) {
      log('Error uploading image:$error');
    }
  }
}
