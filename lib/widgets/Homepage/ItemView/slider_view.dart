import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/decoration.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageviews extends StatefulWidget {
  const HomePageviews({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageviews> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        4,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                color: Colors.black,
                height: 300,
                child: Image.asset(sliderimages[index]),
              ),
            )).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Padding(
                padding: EdgeInsets.only(right: 9),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ))
        ],
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 230,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 7),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thinUnderground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
