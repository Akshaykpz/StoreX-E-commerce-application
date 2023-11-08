import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/utils/theme/decoration.dart';
import 'package:giltezy_2ndproject/utils/theme/squre_tile.dart';
import 'package:lottie/lottie.dart';

import '../../service/google_auth.dart';
import '../../service/signin_user.dart';
import '../../utils/theme/icons.dart';
import '../../utils/theme/textstyle.dart';
import '../login/buttons.dart';
import '../login/textfiled.dart';

class MySigin extends StatefulWidget {
  const MySigin({super.key});

  @override
  State<MySigin> createState() => _MySiginState();
}

class _MySiginState extends State<MySigin> {
  // ...
  final _formKey = GlobalKey<FormState>();
  final _emailSigninController = TextEditingController();

  final _passwordSigninController = TextEditingController();

  final _passwordSigninConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.purple.shade200.withOpacity(0.8),
            Colors.purple.shade800.withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              // Wrap the Column with a Container
              height: 930.h,
              width: double.infinity,
              child: Stack(children: [
                Lottie.asset('animations/Animation - 1699343504674.json'),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Sign Up', style: khheading),
                      MyTextformFiled(
                          icons: emailIcon,
                          controller: _emailSigninController,
                          hinttext: 'email',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          obcuretext: false),
                      MyTextformFiled(
                          icons: PasswordIcon,
                          controller: _passwordSigninController,
                          hinttext: 'password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          obcuretext: false),
                      MyTextformFiled(
                        icons: PasswordIcon,
                        controller: _passwordSigninConfirmController,
                        hinttext: 'confirm password',
                        obcuretext: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Confirm Password';
                          }
                          return null;
                        },
                      ),
                      k10box,
                      MyButton(
                        icons: Icons.login,
                        onPressedCallback: () async {
                          if (_formKey.currentState!.validate()) {
                            String confirmPassword =
                                _passwordSigninConfirmController.text;
                            String email = _emailSigninController.text;
                            String password = _passwordSigninController.text;
                            if (password == confirmPassword) {
                              await handleSignUp(
                                confirmPassword: confirmPassword,
                                context: context,
                                email: email,
                                password: password,
                              );
                            }
                          }
                        },
                        buttontext: 'Sign Up',
                      ),
                      k20box,
                      Squretile(
                        onpress: () {
                          handleGoogleSignIn(context);
                        },
                        imagepath: 'assets/images/Google__G__Logo.png',
                      ),
                      // GoogleAuthButton(
                      //   isLoading: false,
                      //   onPressed: () {
                      //     handleGoogleSignIn(context);
                      //   },
                      //   style: const AuthButtonStyle(
                      //       buttonColor: Colors.white, elevation: 2),
                      // ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
