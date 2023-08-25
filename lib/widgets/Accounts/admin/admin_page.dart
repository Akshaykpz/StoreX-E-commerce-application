import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/admin/appbar.dart';

import 'package:giltezy_2ndproject/widgets/Accounts/admin/buttons.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/admin/categorymangment/category_mgt.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/admin/dashboard/dash_board.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/admin/productmanagment/product_managment.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/admin/usermanagment/user_mangment.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppbarUi(),
            const SizedBox(
              height: 60,
            ),

            // HomeBar(),
            AdminButtons(
              onPressedCallback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashBoard(),
                    ));
              },
              text: 'DashBoard',
              icon: Icons.dashboard,
            ),
            AdminButtons(
              onPressedCallback: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyUserManagment(),
                  )),
              text: 'User Management',
              icon: Icons.account_box,
            ),
            AdminButtons(
                onPressedCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductMangment(),
                      ));
                },
                text: 'Product Management',
                icon: Icons.production_quantity_limits),
            AdminButtons(
              onPressedCallback: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyCategory(),
                    ));
              },
              text: 'Category Management',
              icon: Icons.category,
            ),
          ],
        ),
      ),
    );
  }
}
