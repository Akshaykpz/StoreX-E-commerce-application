import 'package:cloud_firestore/cloud_firestore.dart';

final firebasedata = FirebaseFirestore.instance;
Future adduserProfile({
  required String name,
  required String email,
  required String phone,
}) async {
  await firebasedata.collection('userprofile').doc().set({
    'user': name,
    'user_email': email,
    'user_num': phone,
  }).then((value) => print('user_profile added suceess'));
}
