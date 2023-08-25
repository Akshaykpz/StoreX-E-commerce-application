import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/Accounts/admin/buttons.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Assuming you implement the buildHomeBar method in HomeState
            // Container(
            //   child:
            //   width: MediaQuery.of(context).size.width,
            //   height: 280,
            //   decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //     colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
            //   )),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30, //70 for bottom
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 70, // to shift little up
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(230, 157, 157, 1),
                          Color(0xFFF6EFE9)
                        ]),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      // width: MediaQuery.of(context).size.width * 0.40,
                      // height: MediaQuery.of(context).size.height * 0.40,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .15,
                    height: 200,
                    left: 10,
                    right: 10,
                    child: ClipRRect(
                      child: Card(
                        elevation: 2,
                        child: Container(
                          // height: 20,
                          color: Colors.pink.shade50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            // HomeBar(),
            const AdminButtons(
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
      ),
    );
  }
}
