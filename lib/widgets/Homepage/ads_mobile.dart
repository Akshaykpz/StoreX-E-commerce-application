import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/serach.dart';

import '../../utils/theme/textstyle.dart';
import 'items.dart';
import 'chip_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<HomePage> {
  int currentIndex = 0;
  ScrollController scrollController = ScrollController();
  late Timer _imageChangeTimer;

  @override
  void initState() {
    super.initState();
    startImageChangeTimer();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showbtmappbar = false;
        setState(() {});
      } else {
        showbtmappbar = true;
        setState(() {});
      }
    });
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

  bool showbtmappbar = true;
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
            height: 19,
          ),
          CarouselSlider(
            items: camera.map((imageUrl) {
              return Container(
                width: 300.w,
                height: 60.h, // Adjust this height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18).r,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageUrl),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 170.h, // Set the desired height of the carousel
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),

          // Container(
          //   width: 340.w,
          //   height: 170.h,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(18).r,
          //       image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: AssetImage(camera[currentIndex]),
          //       )),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
                },
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
