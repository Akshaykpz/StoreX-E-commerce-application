import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:giltezy_2ndproject/utils/theme/logout_button.dart';

import 'package:giltezy_2ndproject/widgets/Homepage/product_items.dart';

import 'package:giltezy_2ndproject/widgets/homepage/ItemView/serach_view.dart';
import 'package:page_transition/page_transition.dart';

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

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showbtmappbar = false;
      } else {
        showbtmappbar = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _imageChangeTimer.cancel();
    super.dispose();
  }
  // Your existing code

// Function to handle navigation to the ProductSearchScreen

// Your existing code

  bool showbtmappbar = true;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: const SearchViewPage(),
                              ));
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black,
                        ))),
              ),
            ],
          ),
          toolbarHeight: 220,
          title: const MyPageView(),
          elevation: 0,
          backgroundColor: Colors.deepPurple[50],
        ),
        const SliverFillRemaining(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ,

              // const SizedBox(
              //   height: 30,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Text(
                      'Popular',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         PageTransition(
                  //           type: PageTransitionType.fade,
                  //           child: const CategoryItems(),
                  //         ));
                  //   },
                  //   child: const Text('More..'),
                  // ),
                ],
              ),
              Expanded(child: SecondGrid()),
            ],
          ),
        )
      ],
    );
  }
}
