import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final storage = FirebaseFirestore.instance;
Future addData({required String price, required String name, id}) async {
  await storage
      .collection('products')
      .doc()
      .set({'p_name': name, 'p_price': price, 'categroy_id': id}).then(
          (value) => log('add data'));
}

final collection = storage.collection('products').snapshots();
