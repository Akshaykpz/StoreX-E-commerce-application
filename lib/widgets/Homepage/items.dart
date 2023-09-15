// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';
import 'package:giltezy_2ndproject/service/proudcts.dart';

import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/item_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondGrid extends StatefulWidget {
  const SecondGrid({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondGridState createState() => _SecondGridState();
}

class _SecondGridState extends State<SecondGrid> {
  List<String> yourImagesList = [
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061454177.jpg?alt=media&token=d9a6ae39-0c64-4225-8d65-eddc0cebf46f',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061955495.jpg?alt=media&token=6cf45032-357b-40c1-a37d-a5141d3eb47d',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061454177.jpg?alt=media&token=d9a6ae39-0c64-4225-8d65-eddc0cebf46f',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061955495.jpg?alt=media&token=6cf45032-357b-40c1-a37d-a5141d3eb47d',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061454177.jpg?alt=media&token=d9a6ae39-0c64-4225-8d65-eddc0cebf46f',
    'https://firebasestorage.googleapis.com/v0/b/giltezy.appspot.com/o/images%2F1694061955495.jpg?alt=media&token=6cf45032-357b-40c1-a37d-a5141d3eb47d',
  ];

  List<Color> rowColors = [
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.red.shade100,
  ]; // Define row colors

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: collection,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text('No products available.');
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  2, // Adjust the number of items per row (horizontal)
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              childAspectRatio:
                  0.75, // Adjust the aspect ratio to control item height
            ),
            scrollDirection:
                Axis.vertical, // Set the scroll direction to vertical
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final document = snapshot.data!.docs[index];
              final productName = document['p_name'];
              final productPrice = document['p_price'];

              final rowColor =
                  rowColors[index % rowColors.length]; // Get the row color

              return Padding(
                padding: const EdgeInsets.all(7), // Adjust padding as needed
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemViews(
                            imageUrl: yourImagesList[index],
                            product: Product(
                              name: productName,
                              price: productPrice,
                            ),
                          ),
                        ));
                  },
                  child: Card(
                    color: rowColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              yourImagesList[index],
                              height: 150,
                              width: MediaQuery.sizeOf(context)
                                  .width, // Adjust the height as needed
                              fit: BoxFit.fitWidth,
                            ),
                            if (snapshot.connectionState ==
                                ConnectionState.waiting)
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              style: GoogleFonts.breeSerif(
                                  fontSize: 19, color: Colors.blueAccent),
                            ),
                            Text(
                              '₹$productPrice',
                              style: GoogleFonts.arbutusSlab(
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
