import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ads_mobile.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/home.dart';
import 'package:giltezy_2ndproject/widgets/login/login_page.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (data) {
          if (data != null) {
            return MyHomePage();
          } else {
            return MyLogin();
          }
        },
        error: (error, stackTrace) => CircularProgressIndicator(),
        loading: () => CircularProgressIndicator());
  }
}
