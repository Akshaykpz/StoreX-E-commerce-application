import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme/textstyle.dart';
import 'items.dart';
import 'chip_list.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
    _imageChangeTimer.cancel(); // Cancel the timer in the dispose() method
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
          ItemsGrid(),
          Expanded(child: SecondGrid())
        ],
      ),
    );
  }
}
