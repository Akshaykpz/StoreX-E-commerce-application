import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _controller = PageController();
  int currentIndex = 0; // Track the current index

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _imageView(String image) {
    return Container(
      width: 300, // Adjust this width as needed
      height: 164.0, // Set the desired height of the carousel
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      child: ScrollPageView(
        checkedIndicatorColor: Colors.white,
        indicatorColor: Colors.black,
        controller: ScrollPageController(),
        children: camera.map((image) => _imageView(image)).toList(),
      ),
    );
  }
}
