import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/users_auth.dart';
import 'package:giltezy_2ndproject/service/sign_out.dart';
import 'package:giltezy_2ndproject/service/button.dart';
import 'package:giltezy_2ndproject/widgets/accounts/editprofile/edit_data.dart';
import 'package:giltezy_2ndproject/widgets/accounts/order/order_list_page_view.dart';
import 'package:giltezy_2ndproject/widgets/accounts/shippingAddress/shipping_address.dart';
import 'package:giltezy_2ndproject/widgets/admin/admin_page.dart';
import 'package:giltezy_2ndproject/widgets/wishlist/wish_list.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class Accounts extends ConsumerStatefulWidget {
  const Accounts({super.key});

  @override
  ConsumerState<Accounts> createState() => _AccountsState();
}

class _AccountsState extends ConsumerState<Accounts> {
  bool isAdmin = false;
  @override
  void initState() {
    _isAdminCheck();
    super.initState();
  }

  _isAdminCheck() {
    FirebaseAuth auth0 = FirebaseAuth.instance;
    User? auth = auth0.currentUser;

    if (auth!.email == 'admin@example.com') {
      setState(() {
        isAdmin = true;
      });
    }
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final userdata = ref.watch(userprovider);
    return userdata.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final userdetiles = data[0].data() as Map<String, dynamic>;
        final username = userdetiles['user'];
        final userimage = userdetiles['user_image'];
        return Scaffold(
            body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                // margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
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
                            child: userimage == null
                                ? const CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 50.0,
                                    backgroundImage: AssetImage(
                                        'assets/images/reallogo.png'),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50.0,
                                    backgroundImage: NetworkImage(userimage),
                                  )),
                      )),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            username,
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isAdmin
                          ? MyNewButton(
                              icons: Icons.account_box,
                              onPressedCallback: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: const AdminPage()),
                                );
                              },
                              buttontext: 'Admin',
                            )
                          : const SizedBox(),
                      MyNewButton(
                          icons: Icons.edit,
                          onPressedCallback: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: const EditProfiles(),
                                ));
                          },
                          buttontext: 'Edit Profile'),
                      MyNewButton(
                        icons: Icons.favorite,
                        onPressedCallback: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: const WishList()));
                        },
                        buttontext: 'Wishlist',
                      ),
                      MyNewButton(
                        icons: Icons.check_outlined,
                        onPressedCallback: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: const MyOrder()));
                        },
                        buttontext: 'Orders',
                      ),
                      MyNewButton(
                        icons: Icons.home,
                        onPressedCallback: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: const ShippingAddress()));
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
                    ])));
      },
      error: (error, stackTrace) {
        return const Text(' data is not availble');
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
