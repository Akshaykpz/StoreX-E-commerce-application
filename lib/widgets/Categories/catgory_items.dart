import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';

import 'package:giltezy_2ndproject/utils/theme/colors.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/item_view.dart';
import 'package:page_transition/page_transition.dart';

class CategoryViewPage extends ConsumerStatefulWidget {
  const CategoryViewPage({super.key, required this.docId});
  final String docId;

  @override
  // ignore: library_private_types_in_public_api
  _SecondGridState createState() => _SecondGridState();
}

class _SecondGridState extends ConsumerState<CategoryViewPage> {
  // Define row colors

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productList);
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
              child: product.when(
                data: (data) {
                  final filterData = data
                      .where((element) =>
                          (element.data()
                              as Map<String, dynamic>)['categroy_id'] ==
                          widget.docId)
                      .toList();
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 4.9),
                      crossAxisCount: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1.0,
                    ),
                    itemCount: filterData.length,
                    itemBuilder: (context, index) {
                      final document =
                          filterData[index].data() as Map<String, dynamic>;
                      final reference = filterData[index].reference;
                      final ProductImage = document['P-imageurl'];
                      final productName = document['p_name'];
                      final productPrice = document['p_price'];
                      final productStock = document['stock'];

                      // ignore: non_constant_identifier_names
                      final Productdescription = document['p_description'];

                      // ignore: non_constant_identifier_names

                      final rowColor = rowColors[
                          index % rowColors.length]; // Get the row color

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            print(
                                'heloooooooooooooooooooooooooooooooooooooooo$productStock');
                            Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: ItemViews(
                                    stock: productStock,
                                    imageUrl: ProductImage,
                                    productDescription: Productdescription,
                                    productName: productName,
                                    productPrice: productPrice,
                                    reference: reference,
                                  ),
                                ));
                          },
                          child: Card(
                            color: rowColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: const BorderSide(width: 0.5)),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  child: Image.network(
                                    ProductImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(productName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        )),
                                    Text(productPrice,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        )),
                                    // Text(productStock)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // child: Card(
                          //   color:
                          //       rowColor, // Set the row color as the background color
                          //   shape: const RoundedRectangleBorder(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(7)),
                          //   ),
                          //   elevation: 3,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     // crossAxisAlignment: CrossAxisAlignment.end,
                          //     children: [
                          //       Image.network(
                          //         ProductImage,
                          //         height: 80,
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceEvenly,
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         // crossAxisAlignment: CrossAxisAlignment.end,
                          //         // mainAxisAlignment:
                          //         //     MainAxisAlignment.spaceAround,
                          //         children: [
                          //           Text(
                          //             productName,
                          //             style: TextStyle(color: Colors.blue),
                          //           ),
                          //           Text(
                          //             productPrice,
                          //             style: TextStyle(color: Colors.black),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Image.asset(
                        'assets/images/Animation - 1698048433173.gif'),
                  );
                },
                loading: () {
                  return const CircularProgressIndicator();
                },
              ),
            )
          ]),
        ));
  }
}
