import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/Home/buttons.dart';

class Homes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the button is pressed
            },
          ),
          title: Text(
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
                                BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 4.0,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 12.0,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 15.0,
                                  color: Color(0xFF404040),
                                ),
                              ),
                            ),
                            radius: 50.0,
                            backgroundImage:
                                AssetImage('assets/images/reallogo.png'),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
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
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
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
                margin: EdgeInsets.all(19.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              MyNewButton(onPressedCallback: () {}, buttontext: 'Edit Profile'),
              MyNewButton(
                onPressedCallback: () {},
                buttontext: 'Wishlist',
              ),
              MyNewButton(
                onPressedCallback: () {},
                buttontext: 'Orders',
              ),
              MyNewButton(
                onPressedCallback: () {},
                buttontext: 'Shipping Address',
              ),
              MyNewButton(
                onPressedCallback: () {},
                buttontext: 'Logout',
              )
            ],
          ),
        ));
  }
}
