import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/utils/theme/decoration.dart';

import '../../service/google_auth.dart';
import '../../service/signin_user.dart';
import '../../utils/theme/icons.dart';
import '../../utils/theme/textstyle.dart';
import '../Login/buttons.dart';
import '../Login/textfiled.dart';
import 'background_image.dart';

class MySigin extends StatefulWidget {
  const MySigin({super.key});

  @override
  State<MySigin> createState() => _MySiginState();
}

class _MySiginState extends State<MySigin> {
  // ...
  final _emailSigninController = TextEditingController();

  final _passwordSigninController = TextEditingController();

  final _passwordSigninConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SignUpImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              // Wrap the Column with a Container
              height: 800.h,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sign Up', style: khheading),
                  MyTextformFiled(
                      icons: emailIcon,
                      controller: _emailSigninController,
                      hinttext: 'email',
                      obcuretext: false),
                  MyTextformFiled(
                      icons: PasswordIcon,
                      controller: _passwordSigninController,
                      hinttext: 'password',
                      obcuretext: false),
                  MyTextformFiled(
                      icons: PasswordIcon,
                      controller: _passwordSigninConfirmController,
                      hinttext: 'confirm password',
                      obcuretext: false),
                  k10box,
                  MyButton(
                    onPressedCallback: () {
                      String confirmPassword =
                          _passwordSigninConfirmController.text;
                      String email = _emailSigninController.text;
                      String password = _passwordSigninController.text;
                      if (password == confirmPassword) {
                        handleSignUp(
                          confirmPassword: confirmPassword,
                          context: context,
                          email: email,
                          password: password,
                        );
                      }
                    },
                    buttontext: 'Sign Up',
                  ),
                  k20box,
                  GoogleAuthButton(
                    isLoading: false,
                    onPressed: () {
                      handleGoogleSignIn(context);
                    },
                    style: const AuthButtonStyle(
                        buttonColor: Colors.white, elevation: 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
