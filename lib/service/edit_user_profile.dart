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
  }).then((value) => print('user_profile added suceess'));
}

final useryStream =
    FirebaseFirestore.instance.collection('userprofile').snapshots();

void updateBlockStatus(String userId, bool isBlocked) {
  FirebaseFirestore.instance.collection('userprofile').doc(userId).update({
    'isBlocked': isBlocked,
  }).then((value) {
    print('User block status updated successfully.');
  }).catchError((error) {
    print('Failed to update user block status: $error');
  });
}
