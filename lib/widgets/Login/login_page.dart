import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/service/forgot_password.dart';

import 'package:giltezy_2ndproject/utils/theme/buttons.dart';
import 'package:giltezy_2ndproject/utils/theme/decoration.dart';
import 'package:giltezy_2ndproject/utils/theme/icons.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';

import 'package:giltezy_2ndproject/widgets/Login/background_image.dart';
import 'package:giltezy_2ndproject/widgets/Login/buttons.dart';
import 'package:giltezy_2ndproject/widgets/Login/textfiled.dart';

import '../../service/login_user.dart';
import '../signin/sigin_page.dart';

class MyLogin extends StatefulWidget {
  MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _emailController = TextEditingController();

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Login', style: khheading),
                    MyTextformFiled(
                      icons: emailIcon,
                      controller: _emailController,
                      hinttext: 'email',
                      obcuretext: false,
                    ),
                    MyTextformFiled(
                      icons: PasswordIcon,
                      controller: _passwordController,
                      hinttext: 'password',
                      obcuretext: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
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
                        buttontext: 'Login',
                        onPressedCallback: () {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          handleLogin(
                              context: context,
                              email: email,
                              password: password);
                        }),
                    k20box,
                    // GoogleAuthButton(
                    //   isLoading: false,
                    //   onPressed: () {
                    //     handleGoogleSignIn(context);
                    //   },
                    //   style: AuthButtonStyle(),
                    // ),
                  ],
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
                          "Dont'have an account ?",
                          style: kwbottom,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MySigin(),
                                  ));
                            },
                            child: const Text(
                              'Sign Up',
                              style: kxbutton,
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
