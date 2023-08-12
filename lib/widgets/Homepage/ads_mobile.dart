import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/serach.dart';

import '../../utils/theme/textstyle.dart';
import 'items.dart';
import 'chip_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<HomePage> {
  int currentIndex = 0;
  late Timer _imageChangeTimer;

  @override
  void initState() {
    super.initState();
    startImageChangeTimer();
  }

  void startImageChangeTimer() {
    _imageChangeTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % camera.length;
      });
    });
  }

  @override
  void dispose() {
    _imageChangeTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Serach(),
          SizedBox(
            height: 13,
          ),
          Container(
            width: 340.w,
            height: 170.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18).r,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(camera[currentIndex]),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('See All'),
              ),
            ],
          ),
          ItemsGrid(),
          Expanded(child: SecondGrid())
        ],
      ),
    );
  }
}
