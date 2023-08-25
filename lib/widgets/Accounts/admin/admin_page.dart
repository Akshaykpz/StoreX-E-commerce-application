import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/admin/buttons.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdminButtons(
            text: 'DashBoard',
            icon: Icons.dashboard,
          ),
          AdminButtons(
            text: 'User Management',
            icon: Icons.account_box,
          ),
          AdminButtons(
              text: 'Product Management',
              icon: Icons.production_quantity_limits),
          AdminButtons(
            text: 'Category Management',
            icon: Icons.category,
          ),
        ],
      ),
    );
  }
}
