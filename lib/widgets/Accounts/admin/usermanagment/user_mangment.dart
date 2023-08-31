import 'package:flutter/material.dart';

class MyUserManagment extends StatelessWidget {
  const MyUserManagment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(children: [
        Card(
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 53,
            width: 400,
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Users"), Text("Actions"), Text("Status")]),
          ),
        )
      ]),
    );
  }
}
