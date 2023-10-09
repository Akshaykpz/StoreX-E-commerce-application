import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giltezy_2ndproject/service/find_category.dart';

final storage = FirebaseFirestore.instance;
Future addData(
    {required String price,
    required String name,
    required String categoryname,
    required String description,
    required String imageurls}) async {
  final id = await findDocumentIdByCategory(categoryname);
  if (id != null) {
    await storage.collection('products').doc().set({
      'p_name': name,
      'p_price': price,
      'categroy_id': id,
      'p_description': description,
      'P-imageurl': imageurls
    }).then((value) => log('add data'));
  } else {
    log(id!);
    // print('id is $id');
  }
}

final collection = storage.collection('products').snapshots();
