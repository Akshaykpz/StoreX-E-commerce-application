import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:giltezy_2ndproject/controller/category_prov.dart';
import 'package:giltezy_2ndproject/widgets/admin/categorymangment/category_add.dart';
import 'package:giltezy_2ndproject/widgets/admin/categorymangment/category_name.dart';
import 'package:giltezy_2ndproject/widgets/admin/categorymangment/category_popup.dart';

class MyCategory extends ConsumerStatefulWidget {
  const MyCategory({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends ConsumerState<MyCategory> {
  @override
  Widget build(BuildContext context) {
    final category = ref.watch(categoryProvider);
    final ScrollController scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            category.when(
              data: (catgorydata) {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final category =
                        catgorydata[index].data() as Map<String, dynamic>;

                    final productname = category['cat_name'];
                    final productimage = category['cat_image'];
                    final CatId = catgorydata[index].id;
                    print('hello  {$productimage}');

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
                                  Categoryedit(categoryid: CatId),
                                ],
                              ),
                              FutureBuilder(
                                future: precacheImage(
                                  NetworkImage(productimage),
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
                                    productimage,
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
                                width: 90,
                                height: 30,
                                name: productname ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: catgorydata.length),
                );
              },
              error: (error, stackTrace) {
                return const CircularProgressIndicator();
              },
              loading: () {
                return const CircularProgressIndicator();
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
                builder: (context) => const CategoryAdd(),
              ),
            );
          },
          scrollController: scrollController,
          animateIcon: true,
          inverted: false,
          radius: 10.0,
        ),
      ),
    );
  }
}
