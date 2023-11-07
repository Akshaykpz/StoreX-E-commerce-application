import 'package:intl/intl.dart'; // Import the intl package

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataAdd {
  final firestore = FirebaseFirestore.instance;

  Future<void> checOutitems(
    String paymentId,
    DocumentReference? productReference,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    final currentTime = DateTime.now();
    final formattedTime = DateFormat('yyyy-MM-dd - kk:mm').format(currentTime);
    await firestore
        .collection('checkout')
        .doc(user!.email)
        .collection('orderitems')
        .add({
      'payment_id': paymentId,
      'product_reference': productReference,
      'time': formattedTime,
      // Optionally add product reference here
    });
  }
}
