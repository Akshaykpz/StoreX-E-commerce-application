// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';

import 'package:giltezy_2ndproject/utils/theme/colors.dart';

import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/item_view.dart';

import 'package:giltezy_2ndproject/widgets/cacheed_image.dart';

class SecondGrid extends ConsumerStatefulWidget {
  const SecondGrid({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondGridState createState() => _SecondGridState();
}

class _SecondGridState extends ConsumerState<SecondGrid> {
  @override
  Widget build(BuildContext context) {
    final proudct = ref.watch(productList);

    return proudct.when(data: (productdata) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 0.75,
          ),
          scrollDirection: Axis.vertical,
          itemCount: productdata.length,
          itemBuilder: (context, index) {
            final document = productdata[index].data() as Map<String, dynamic>;
            ;
            final productName = document['p_name'];
            final productPrice = document['p_price'];
            final productImage = document['P-imageurl'];
            // final reference = document[index].reference;
            final reference = productdata[index].reference;

            // ignore: non_constant_identifier_names
            final Productdescription = document['p_description'];

            final rowColor = rowColors[index % rowColors.length];

            return Padding(
              padding: const EdgeInsets.all(7),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemViews(
                                reference: reference,
                                imageUrl: productImage,
                                productDescription: Productdescription,
                                productName: productName,
                                productPrice: productPrice,
                              )));
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
                          CachedImage(
                            url: productImage,
                            height: 150,
                          ),
                          // Image.network(
                          //   productImage,
                          //   height: 100,
                          //   width: MediaQuery.sizeOf(context)
                          //       .width, // Adjust the height as needed
                          //   fit: BoxFit.fitWidth,
                          // ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: const TextStyle(
                                fontSize: 19, color: Colors.blueAccent),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '₹$productPrice',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }, error: (error, stackTrace) {
      return Center(child: CircularProgressIndicator());
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}
