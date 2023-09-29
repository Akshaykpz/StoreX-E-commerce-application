import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/categorymangment/category_name.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_edit_delete.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/productmanagment/product_managment.dart';

class MyProductView extends StatelessWidget {
  const MyProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          StreamBuilder<QuerySnapshot>(
              stream: collection,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final prouctdata = snapshot.data!.docs[index];
                    final proudctimg = prouctdata['P-imageurl'];
                    final productname = prouctdata['p_name'];
                    final proudctprice = prouctdata['p_price'];

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
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [],
                                ),
                                FutureBuilder(
                                  future: precacheImage(
                                    NetworkImage(proudctimg),
                                    context,
                                  ),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    return Image.network(
                                      proudctimg,
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fitWidth,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Categoryname(
                                  name: productname ?? '1200',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Categoryname(
                                  name: proudctprice ?? '1200',
                                )
                              ],
                            ),
                          ),
                        ));
                  }, childCount: snapshot.data!.docs.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 0.75,
                  ),
                );
              })
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
