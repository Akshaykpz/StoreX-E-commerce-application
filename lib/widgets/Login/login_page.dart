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
import 'package:page_transition/page_transition.dart';

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
  bool? _isSecure;

  final _passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSecure = false;
  }

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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!isValidEmail(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                      ),

                      MyTextformFiled(
                        obcuretext: _isSecure,
                        icon: IconButton(
                          icon: Icon(
                            _isSecure!
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isSecure = !_isSecure!;
                            });
                          },
                        ),
                        icons: PasswordIcon,
                        controller: _passwordController,
                        hinttext: 'password',
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
                      // _isLoading
                      //     ? Center(
                      //         child: CircularProgressIndicator(),
                      //       )
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
                          const SizedBox(
                            width: 22,
                          ),
                          // Squretile(
                          //     onpress: () {
                          //       handleGoogleSignIn(context);
                          //     },
                          //     imagepath: 'assets/images/XGehZ_9v_400x400.jpg'),
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
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: const MySigin(),
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
