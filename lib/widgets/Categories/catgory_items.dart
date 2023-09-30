import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/homepage/ItemView/serach.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryViewPage extends StatefulWidget {
  const CategoryViewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondGridState createState() => _SecondGridState();
}

class _SecondGridState extends State<CategoryViewPage> {
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
    Stream<QuerySnapshot> productStream =
        FirebaseFirestore.instance.collection('products').snapshots();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(children: [
            // Serach(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child:

                    // Stream to listen for changes in the Firestore collection

                    // Use a StreamBuilder to display the data
                    StreamBuilder<QuerySnapshot>(
              stream: productStream,
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 4.9),
                    crossAxisCount: 1,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1.0,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final document = snapshot.data!.docs[index];
                    final productName = document['p_name'];
                    final productPrice = document['p_price'];
                    final rowColor = rowColors[
                        index % rowColors.length]; // Get the row color

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const ItemViews(),
                          //     ));
                        },
                        child: Card(
                          color:
                              rowColor, // Set the row color as the background color
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          elevation: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                children: [
                                  Image.network(
                                    yourImagesList[index],
                                    height: 130,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    productName,
                                    style: GoogleFonts.dmSerifDisplay(
                                        color: Colors.blue),
                                  ),
                                  Text(
                                    productPrice,
                                    style: GoogleFonts.arbutusSlab(
                                        color: Colors.black),
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
              },
            ))
          ]),
        ));
  }
}
