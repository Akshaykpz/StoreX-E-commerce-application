import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:giltezy_2ndproject/service/add_data.dart';
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
                    child: Center(child: SizedBox()),
                  );
                }
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final prouctdata = snapshot.data!.docs[index];
                    final proudctimg = prouctdata['P_imageurl'];
                    final productname = prouctdata['p_name'];
                    final proudctprice = prouctdata['p_price'];

                    return Image.network(productname);
                  }),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
