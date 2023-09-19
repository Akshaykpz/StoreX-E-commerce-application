import 'package:flutter/material.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:giltezy_2ndproject/service/category_item_add.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/categorymangment/category_add.dart';

import 'package:google_fonts/google_fonts.dart';

class MyCategory extends StatelessWidget {
  const MyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: catgoryStream,
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final categorydata = snapshot.data!.docs[index];
                      final productname = categorydata['cat_name'];
                      final productimage = categorydata['cat_image'];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red,
                          ),
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              productname,
                              style: GoogleFonts.breeSerif(
                                  fontSize: 19, color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: snapshot.data!.docs.length,
                  ),
                );
              },
            ),
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
                builder: (context) => const CategoryAdd(),
              ),
            );
          },
          scrollController: _scrollController,
          animateIcon: true,
          inverted: false,
          radius: 10.0,
        ),
      ),
    );
  }
}
