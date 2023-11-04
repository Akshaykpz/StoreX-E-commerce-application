import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/bottombar_view.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/main_home_view.dart';

import 'package:giltezy_2ndproject/widgets/categories/category_view.dart';

import 'package:giltezy_2ndproject/widgets/cart/cart_view.dart';
import 'package:giltezy_2ndproject/widgets/accounts/mainhome.dart';

class MyItemviewpage extends StatefulWidget {
  const MyItemviewpage({super.key});

  @override
  State<MyItemviewpage> createState() => _MyItemviewpageState();
}

class _MyItemviewpageState extends State<MyItemviewpage> {
  int _selectedIndex = 0;

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomTabBar(
          selectedIndex: _selectedIndex,
          onTabSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: const [
                      HomePage(),
                      CategoryItems(),
                      Cart(),
                      Accounts()
                    ],
                  ),
                ),
              ],
            )));
  }
}
