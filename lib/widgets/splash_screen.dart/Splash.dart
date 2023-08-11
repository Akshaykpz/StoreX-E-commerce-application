import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/utils/theme/theme.dart';
import 'package:giltezy_2ndproject/widgets/Login/login_page.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUtils.scaffoldBackgroundColorblack,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 262.w,
              height: 216.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                width: 150.w,
                height: 50.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/giltezy.jpg'),
                  ),
                ),
              ),
              Container(
                width: 220.w,
                height: 180.h,
                margin: EdgeInsets.only(
                  left: 85,
                  bottom: 70,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/reallogo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyLogin(),
                    ));
              },
              child: Text('haii'))
        ],
      ),
    );
  }
}
