import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/login_user.dart';
import 'package:giltezy_2ndproject/service/sign_out.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/admin/admin_page.dart';

import 'package:giltezy_2ndproject/widgets/accounts/shippingAddress/shipping_address.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/allSettings/wish_list.dart';
import 'package:giltezy_2ndproject/widgets/accounts/order/order_status.dart';

import 'package:giltezy_2ndproject/widgets/Accounts/buttons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'editprofile/edit_data.dart';

// ignore: must_be_immutable
class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  bool isAdmin = false;
  @override
  void initState() {
    _isAdminCheck();
    super.initState();
  }

  _isAdminCheck() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? auth = _auth.currentUser;

    if (auth!.email == 'admin@example.com') {
      setState(() {
        isAdmin = true;
      });
    }
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        child: Text(
                          user!.email!,
                          style: GoogleFonts.acme(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isAdmin
                  ? MyNewButton(
                      icons: Icons.account_box,
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
                  icons: Icons.edit,
                  onPressedCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfiles(),
                        ));
                  },
                  buttontext: 'Edit Profile'),
              MyNewButton(
                icons: Icons.favorite,
                onPressedCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WishList()));
                },
                buttontext: 'Wishlist',
              ),
              MyNewButton(
                icons: Icons.check_outlined,
                onPressedCallback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyOrder()));
                },
                buttontext: 'Orders',
              ),
              MyNewButton(
                icons: Icons.home,
                onPressedCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShippingAddress()));
                },
                buttontext: 'Shipping Address',
              ),
              MyNewButton(
                icons: Icons.logout,
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
