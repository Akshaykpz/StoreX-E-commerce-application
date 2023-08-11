import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(thickness: 1, color: Colors.white),
        Container(
            height: 70,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: GNav(
                backgroundColor: Colors.transparent,
                onTabChange: onTabChange,
                color: Colors.black,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.teal,
                padding: EdgeInsets.all(15),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                    text: 'Cart',
                  ),
                  GButton(
                    icon: Icons.category,
                    text: 'category',
                  ),
                  GButton(
                    icon: Icons.account_box,
                    text: 'account',
                  ),
                ],
                selectedIndex: selectedIndex,
              ),
            )),
      ],
    );
  }
}
