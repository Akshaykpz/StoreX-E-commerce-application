import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

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
      print('Error saving data: $error');
      throw error;
    }
  }
}
