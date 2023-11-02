import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: selectedIndex,
      showElevation: true,
      onItemSelected: onTabSelected,
      items: [
        _buildTabBarItem(Icons.home, 'Home'),
        _buildTabBarItem(Icons.category, 'Category'),
        _buildTabBarItem(Icons.shopping_bag, 'Cart'),
        _buildTabBarItem(Icons.settings, 'Settings'),
      ],
    );
  }

  FlashyTabBarItem _buildTabBarItem(IconData iconData, String title) {
    return FlashyTabBarItem(
      icon: Icon(iconData),
      title: Text(title),
    );
  }
}
