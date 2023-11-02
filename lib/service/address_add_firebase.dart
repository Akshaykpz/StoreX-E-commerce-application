import 'package:cloud_firestore/cloud_firestore.dart';

final storage = FirebaseFirestore.instance;

Future<void> addAddress({
  required String name,
  required String address,
  required String phone,
  required String pincode,
  required String district,
}) async {
  await storage.collection('address').doc().set({
    'name': name,
    'address': address,
    'phone': phone,
    'pincode': pincode,
    'district': district
  });
}
