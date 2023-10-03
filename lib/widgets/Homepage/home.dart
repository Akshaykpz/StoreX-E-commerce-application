import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/categories/category_view.dart';

import 'main_home_view.dart';
import 'bottombar.dart';
import 'package:giltezy_2ndproject/widgets/cart/cart_view.dart';
import 'package:giltezy_2ndproject/widgets/accounts/mainhome.dart';

class MyItemviewpage extends StatefulWidget {
  const MyItemviewpage({super.key});

  @override
  State<MyItemviewpage> createState() => _MyItemviewpageState();
}

class _MyItemviewpageState extends State<MyItemviewpage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              ))),
    );
  }
}
