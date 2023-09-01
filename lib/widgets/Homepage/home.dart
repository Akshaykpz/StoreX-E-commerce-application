import 'package:flutter/material.dart';

import 'ads_mobile.dart';
import 'bottombar.dart';
import 'package:giltezy_2ndproject/widgets/cart/cart_view.dart';
import 'package:giltezy_2ndproject/widgets/accounts/mainhome.dart';
import 'package:giltezy_2ndproject/widgets/categories/catgory_items.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              // Add any code here to handle the tab change, such as navigating to different screens.
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
                        Cart(),
                        CategoryItems(),
                        Accounts()
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
