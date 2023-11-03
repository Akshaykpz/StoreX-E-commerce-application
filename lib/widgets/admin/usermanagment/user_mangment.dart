import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/admin/usermanagment/admintext.dart';
import 'package:giltezy_2ndproject/widgets/admin/usermanagment/users_list.dart';

class MyUserManagment extends StatelessWidget {
  const MyUserManagment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(padding: EdgeInsets.all(7)),
            Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset:
                          const Offset(10, 10), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.7),
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset:
                          const Offset(-10, -10), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                height: 53,
                width: 400,
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AdminText(text: 'Users'),
                      AdminText(text: 'Status'),
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const UserList(),
          ]),
        ),
      ),
    );
  }
}
