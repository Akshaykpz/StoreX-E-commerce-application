import 'dart:typed_data';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImage(String childname, Uint8List file) async {
    Reference ref = storage.ref().child(childname);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> savedata({required String imageUrl}) async {
    try {
      await firestore.collection('userprofile').add({'imagelink': imageUrl});
    } catch (error) {
      log('error:$error');
      rethrow;
    }
  }
}
