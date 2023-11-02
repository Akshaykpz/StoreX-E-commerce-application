// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:giltezy_2ndproject/controller/provder_auth.dart';

// class DropDownitem extends ConsumerStatefulWidget {
//   const DropDownitem({
//     super.key,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _SecondGridState createState() => _SecondGridState();
// }

// class _SecondGridState extends ConsumerState<DropDownitem> {
//   CollectionReference categoryCollection =
//       FirebaseFirestore.instance.collection('categories');

//   List<String> categories = []; // List to store fetched categories
//   String dropdownValue = ''; // Default value for dropdown

//   @override
//   void initState() {
//     super.initState();
//     fetchCategories();
//   }

//   Future<void> fetchCategories() async {
//     try {
//       QuerySnapshot querySnapshot = await categoryCollection.get();
//       List<String> fetchedCategories = [];
//       querySnapshot.docs.forEach((doc) {
//         String categoryName = doc['cat_name'];
//         fetchedCategories.add(categoryName);
//       });
//       setState(() {
//         categories = fetchedCategories;
//         dropdownValue =
//             fetchedCategories.isNotEmpty ? fetchedCategories[0] : '';
//       });
//     } catch (e) {
//       print('Error fetching categories: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final product = ref.watch(productList);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         title: DropdownButton<String>(
//           value: dropdownValue,
//           icon: const Icon(Icons.arrow_drop_down),
//           onChanged: (String? newValue) {
//             setState(() {
//               dropdownValue = newValue!;
//             });
//             // Add logic to filter products based on the selected category
//           },
//           items: categories.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//       ),
//       // ... (existing code)
//     );
//   }
// }
