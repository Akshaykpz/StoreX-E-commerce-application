import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giltezy_2ndproject/controller/category_prov.dart';
import 'package:giltezy_2ndproject/controller/provder_auth.dart';
import 'package:giltezy_2ndproject/service/category_item_add.dart';
import 'package:giltezy_2ndproject/utils/theme/colors.dart';
import 'package:giltezy_2ndproject/widgets/categories/catgory_items.dart';

class CategoryItems extends ConsumerStatefulWidget {
  const CategoryItems({super.key});

  @override
  ConsumerState<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends ConsumerState<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    final categoryData = ref.watch(categoryProvider);
    final proudctData = ref.watch(productList);
    return categoryData.when(
      data: (category) {
        return SafeArea(
          child: Scaffold(
            body: GridView.builder(
              itemCount: category.length,
              padding: const EdgeInsets.all(7),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350.0,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final catdata = category[index].data() as Map<String, dynamic>;
                final docId = category[index].id;

                final cartname = catdata['cat_name'];
                final cartimage = catdata['cat_image'];
                final rowColor = rowColors[index % rowColors.length];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryViewPage(docId: docId),
                        ));
                  },
                  child: Card(
                    color: rowColor,
                    // color: Colors.red,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.all(1.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(cartname,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              )),
                          child: Image.network(cartimage),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return CircularProgressIndicator();
      },
      loading: () {
        return CircularProgressIndicator();
      },
    );
    // return StreamBuilder(
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error.toString()}');
    //     }

    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     }

    //     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
    //       return const Text('No products available.');
    //     }
    //     return GridView.builder(
    //       itemCount: snapshot.data!.docs.length,
    //       padding: const EdgeInsets.all(7),
    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //         maxCrossAxisExtent: 350.0,
    //         childAspectRatio: 2 / 2,
    //         crossAxisSpacing: 6,
    //         mainAxisSpacing: 4,
    //       ),
    //       itemBuilder: (context, index) {
    //         final categorydata = snapshot.data!.docs[index];

    //   },
    //   stream: catgoryStream,

    // );
  }
}
