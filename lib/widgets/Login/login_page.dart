import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/service/forgot_password.dart';
import 'package:giltezy_2ndproject/service/google_auth.dart';

import 'package:giltezy_2ndproject/utils/theme/buttons.dart';
import 'package:giltezy_2ndproject/utils/theme/decoration.dart';
import 'package:giltezy_2ndproject/utils/theme/icons.dart';
import 'package:giltezy_2ndproject/utils/theme/squre_tile.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';

import 'package:giltezy_2ndproject/widgets/login/background_image.dart';
import 'package:giltezy_2ndproject/widgets/login/buttons.dart';
import 'package:giltezy_2ndproject/widgets/login/textfiled.dart';

import '../../service/login_user.dart';
import '../signin/sigin_page.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Backgroundimage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            height: 800.h,
            width: double.infinity,
            child: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Login', style: khheading),
                      MyTextformFiled(
                        icons: emailIcon,
                        controller: _emailController,
                        hinttext: 'email',
                        obcuretext: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!isValidEmail(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                      ),
                      // Text(
                      //   _emailError ?? '', // Display the email error message
                      //   style: TextStyle(color: Colors.red),
                      // ),
                      MyTextformFiled(
                        icons: PasswordIcon,
                        controller: _passwordController,
                        hinttext: 'password',
                        obcuretext: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyButtons(
                                buttonText: 'Forgot Password',
                                destinationRoute: ForgotPasswordScreen()),
                          ],
                        ),
                      ),
                      k20box,
                      MyButton(
                          icons: Icons.login,
                          buttontext: 'Login',
                          onPressedCallback: () {
                            if (_formKey.currentState!.validate()) {
                              String email = _emailController.text;
                              String password = _passwordController.text;
                              handleLogin(
                                  context: context,
                                  email: email,
                                  password: password);
                            }
                          }),
                      k20box,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Squretile(
                            onpress: () {
                              handleGoogleSignIn(context);
                            },
                            imagepath: 'assets/images/Google__G__Logo.png',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0.2,
                  child: Container(
                    alignment: Alignment.center,
                    width: 400.w,
                    height: 59.h,
                    decoration: khdecoarion,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Create an Account.",
                          style: kwbottom,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MySigin(),
                                  ));
                            },
                            child: const Text(
                              'Sign Up',
                              style: kstext,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
