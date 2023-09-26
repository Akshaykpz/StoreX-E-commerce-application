import 'package:firebase_auth/firebase_auth.dart';

import '../utils/theme/firebase_const.dart';

class Authentication {
  Stream<User?> get authchange => auth.authStateChanges();
}
