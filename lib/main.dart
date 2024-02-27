import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:giltezy_2ndproject/widgets/auth_page.dart';

// Import the utils.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: (MyApp())));
}

final firebaseinitiltizeprovider = FutureProvider((ref) async {
  return await Firebase.initializeApp();
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initilize = ref.watch(firebaseinitiltizeprovider);
    return ScreenUtilInit(
      designSize: const Size(375, 836),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          // theme: AppTheme.themeData,
          home: initilize.when(
            data: (data) {
              return const AuthPage();
            },
            error: (error, stackTrace) => const Text(" is error"),
            loading: () => Center(child: const CircularProgressIndicator()),
          )),
    );
  }
}
