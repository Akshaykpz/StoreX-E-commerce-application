// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:giltezy_2ndproject/widgets/Homepage/home.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

// class HiddenDrawer extends StatefulWidget {
//   const HiddenDrawer({Key? key}) : super(key: key);

//   @override
//   State<HiddenDrawer> createState() => _HiddenDrawerState();
// }

// class _HiddenDrawerState extends State<HiddenDrawer> {
//   List<ScreenHiddenDrawer> _pages = [];

//   @override
//   void initState() {
//     super.initState();
//     _pages.add(ScreenHiddenDrawer(
//         ItemHiddenMenu(
//             selected: false,
//             name: 'Home',
//             colorLineSelected: Colors.black,
//             baseStyle: TextStyle(),
//             selectedStyle: TextStyle()),
//         MyHomePage()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       actionsAppBar: [
//         Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: IconButton(
//             icon: Icon(
//               Icons.search,
//             ),
//             onPressed: () {},
//             color: Colors.black,
//           ),
//         )
//       ],
//       elevationAppBar: 0.90,
//       backgroundColorContent: Colors.white60,
//       backgroundColorAppBar: Colors.teal,
//       backgroundColorMenu: Colors.white,
//       screens: _pages,
//       initPositionSelected: 0,
//     );
//   }
// }
