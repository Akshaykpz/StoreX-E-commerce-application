import 'package:cloud_firestore/cloud_firestore.dart';

final firebasedata = FirebaseFirestore.instance;
Future adduserProfile(
    {required String name,
    required String email,
    required String phone,
    required String imagurl}) async {
  await firebasedata.collection('userprofile').doc().set({
    'user': name,
    'user_email': email,
    'user_num': phone,
    'user_image': imagurl,
    // ignore: avoid_print
  }).then((value) => print('user_profile added suceess'));
}

final useryStream =
    FirebaseFirestore.instance.collection('userprofile').snapshots();

void updateBlockStatus(String userId, bool isBlocked) {
  FirebaseFirestore.instance
      .collection('userprofile')
      .doc(userId)
      .update({
        'isBlocked': isBlocked,
      })
      .then((value) {})
      .catchError((error) {});
}
