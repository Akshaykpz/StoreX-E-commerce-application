import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giltezy_2ndproject/controller/category_prov.dart';

import 'package:giltezy_2ndproject/utils/theme/colors.dart';
import 'package:giltezy_2ndproject/widgets/categories/catgory_items.dart';
import 'package:page_transition/page_transition.dart';

class CategoryItems extends ConsumerStatefulWidget {
  const CategoryItems({super.key});

  @override
  ConsumerState<CategoryItems> createState() => _CategoryItemsState();
}

TextEditingController textController = TextEditingController();

class _CategoryItemsState extends ConsumerState<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    final categoryData = ref.watch(categoryProvider);

    return SafeArea(
      child: categoryData.when(
        data: (category) {
          return Scaffold(
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
                final rowColor = IconsColors[index % rowColors.length];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: CategoryViewPage(docId: docId),
                        ));
                  },
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: rowColor),

                      padding: const EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.all(2.0),
                      child: Column(children: [
                        Image.network(
                          cartimage,
                          height: 110.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(cartname,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                shadows: [
                                  Shadow(
                                      blurRadius: 2,
                                      color: Colors.white,
                                      offset: Offset(0, 2))
                                ],
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ]),
                      // child: GridTile(

                      //   child: Image.network(cartimage),
                      // ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return const Text(' is error');
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
