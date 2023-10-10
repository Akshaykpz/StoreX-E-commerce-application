import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';

import 'package:giltezy_2ndproject/widgets/admin/categorymangment/category_name.dart';
import 'package:giltezy_2ndproject/widgets/admin/productmanagment/product_edit_delete.dart';
import 'package:giltezy_2ndproject/widgets/admin/productmanagment/product_managment.dart';

class MyProductView extends ConsumerStatefulWidget {
  const MyProductView({super.key, this.productId});
  final String? productId;
  @override
  ConsumerState<MyProductView> createState() => _MyProductViewState();
}

class _MyProductViewState extends ConsumerState<MyProductView> {
  @override
  Widget build(BuildContext context) {
    final proudctdata = ref.watch(productList);
    final ScrollController scrollController = ScrollController();
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          proudctdata.when(
            data: (data) {
              return SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final prodata = data[index].data() as Map<String, dynamic>;
                  final proudctimg = prodata['P-imageurl'];
                  final productname = prodata['p_name'];
                  final proudctprice = prodata['p_price'];

                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        elevation: 3,
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Productedit(
                                    productid: widget.productId.toString(),
                                  ),
                                ],
                              ),
                              FutureBuilder(
                                future: precacheImage(
                                  NetworkImage(proudctimg),
                                  context,
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child:
                                            const CircularProgressIndicator());
                                  }
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  }
                                  return Image.network(
                                    proudctimg,
                                    height: 100,
                                    fit: BoxFit.fitWidth,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Categoryname(
                                name: productname ?? '1200',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Categoryname(
                                name: proudctprice ?? '1200',
                              )
                            ],
                          ),
                        ),
                      ));
                }, childCount: data.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                  childAspectRatio: 0.75,
                ),
              );
            },
            error: (error, stackTrace) {
              return CircularProgressIndicator();
            },
            loading: () {
              return CircularProgressIndicator();
            },
          )
        ],
      ),
      floatingActionButton: ScrollingFabAnimated(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        text: const Text(
          'Add ',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        onPress: () {
          print("object");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductMangment(),
            ),
          );
        },
        scrollController: scrollController,
        animateIcon: true,
        inverted: false,
        radius: 10.0,
      ),
    ));
  }
}
