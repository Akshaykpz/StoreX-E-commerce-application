import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/serach.dart';
import 'package:giltezy_2ndproject/widgets/categories/category_view.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Serach(),
                  const SizedBox(
                    height: 19,
                  ),
                  CarouselSlider(
                    items: camera.map((
                      imageUrl,
                    ) {
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
                  const SizedBox(
                    height: 20,
                  ),
                  const ItemsGrid(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Popular',
                          style: GoogleFonts.abhayaLibre(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoryItems(),
                              ));
                        },
                        child: const Text('More..'),
                      ),
                    ],
                  ),
                  const Expanded(child: SecondGrid())
                ],
              ),
            )
          ],
        ));
  }
}
