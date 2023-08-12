// import 'package:flutter/material.dart';
// import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
// import 'package:giltezy_2ndproject/widgets/Categories/category_items.dart';

// class Category extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Icon(
//               Icons.search,
//               color: Colors.black,
//              ),
//           )
//         ],
//         leading: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.arrow_back_ios_new_outlined,
//               color: Colors.black,
//             )),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Text(
//           'Categoryes',
//           style: kvrheading,
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             CategoryItems(),
//             Container(
//               padding: EdgeInsets.all(5),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                     ),
//                     itemCount: 8,
//                     primary: false,
//                     shrinkWrap: true,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: EdgeInsets.only(top: 30, left: 15),
//                         child: Card(
//                           color: Color.fromRGBO(225, 227, 229, 100),
//                           elevation: 3,
//                           child: (index % 2 == 0
//                               ? Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/anh-nhat-PdALQmfEqvE-unsplash.jpg',
//                                     fit: BoxFit.fill,
//                                   ),
//                                 )
//                               : Image.asset(
//                                   'assets/images/anh-nhat-yqcloMb3Abw-unsplash.jpg',
//                                   fit: BoxFit.fill,
//                                 )),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:giltezy_2ndproject/widgets/Categories/category_items.dart';

// class Category extends StatefulWidget {
//   @override
//   _FoundCoursesState createState() => _FoundCoursesState();
// }

// class _FoundCoursesState extends State<Category> {
//   // bool _applied = false;
//   List<int> selectedIndexList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//         ),
//         body: GridView.builder(
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//           scrollDirection: Axis.vertical,
//           itemCount: 8,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(
//                 bottom: 10.0,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   CategoryItems(),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       height: 200,
//                       width: 170,
//                       decoration: BoxDecoration(
//                         // border: Border.all(color: Color(0xff940D5A)),
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(17.0),
//                         boxShadow: <BoxShadow>[
//                           BoxShadow(
//                             color: Colors.grey,
//                             offset: Offset(1.0, 15.0),
//                             blurRadius: 20.0,
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: <Widget>[
//                           Image.asset(
//                             'assets/images/anh-nhat-yqcloMb3Abw-unsplash.jpg',
//                             fit: BoxFit.fitWidth,
//                             // textAlign: TextAlign.center,
//                           ),
//                           Container(
//                             height: 73,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   'SAMSUNG A -50 s',
//                                   style: TextStyle(
//                                       fontSize: 12, color: Colors.white),
//                                 ),
//                                 Text(
//                                   '12000',
//                                   style: TextStyle(
//                                       fontSize: 12, color: Colors.green),
//                                 ),
//                               ],
//                             ),
//                             width: 350,
//                             decoration: BoxDecoration(
//                               // border: Border.all(color: Color(0xff940D5A)),
//                               color: Colors.blue[100],
//                               borderRadius: BorderRadius.only(
//                                   bottomRight: Radius.circular(18),
//                                   bottomLeft: Radius.circular(18)),
//                               boxShadow: <BoxShadow>[
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   offset: Offset(1.0, 15.0),
//                                   blurRadius: 20.0,
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ));
//   }
// }
