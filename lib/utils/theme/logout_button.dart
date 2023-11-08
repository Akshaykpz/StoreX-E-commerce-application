import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      width: 330,
      height: 169.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        image: DecorationImage(
          opacity: 12,
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
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
