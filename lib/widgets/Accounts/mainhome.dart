import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/login_user.dart';
import 'package:giltezy_2ndproject/service/sign_out.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/admin/admin_page.dart';

import 'package:giltezy_2ndproject/widgets/Accounts/shippingAddress/shipping_address.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/allSettings/wish_list.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/order/order_status.dart';

import 'package:giltezy_2ndproject/widgets/Accounts/buttons.dart';

import 'editprofile/edit_data.dart';

// ignore: must_be_immutable
class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the button is pressed
            },
          ),
          title: const Text(
            'Account',
            style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
          ),
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(19.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      child: CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 4.0,
                            ),
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 50.0,
                            backgroundImage:
                                AssetImage('assets/images/reallogo.png'),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: const Text(
                          'AKSHAY KP',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 70,
                        padding: const EdgeInsets.only(top: 8.0),
                        child: const Text(
                          '9072951662',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isLoggedIn && isAdmin
                  ? MyNewButton(
                      onPressedCallback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdminPage()),
                        );

                        // Handle user login
                        // For example, show an error message or navigate to a different page
                      },
                      buttontext: 'Admin',
                    )
                  : const SizedBox(),
              MyNewButton(
                  onPressedCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfiles(),
                        ));
                  },
                  buttontext: 'Edit Profile'),
              MyNewButton(
                onPressedCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WishList()));
                },
                buttontext: 'Wishlist',
              ),
              MyNewButton(
                onPressedCallback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyOrder()));
                },
                buttontext: 'Orders',
              ),
              MyNewButton(
                onPressedCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShippingAddress()));
                },
                buttontext: 'Shipping Address',
              ),
              MyNewButton(
                onPressedCallback: () {
                  showSignOutDialog(context);
                },
                buttontext: 'Logout',
              )
            ],
          ),
        ));
  }
}
