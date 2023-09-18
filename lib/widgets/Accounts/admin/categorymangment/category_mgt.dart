import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/firebase_email.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/categorymangment/add_cat_button.dart';
import 'package:giltezy_2ndproject/widgets/accounts/admin/categorymangment/category_add.dart';
import 'package:hidable/hidable.dart';

class MyCategory extends StatelessWidget {
  const MyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              childAspectRatio: 1.0,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(20.0),
                  color: RandomColorModel()
                      .getColor(), // Use the random color function here
                  child: Center(
                    child: GridTile(
                      footer: Text(
                        'Item $index',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Icon(Icons.access_alarm,
                          size: 40.0, color: Colors.white),
                    ),
                  ),
                );
              },
              childCount: 16, // Number of grid items
            ),
          ),
        ],
      ),
      bottomNavigationBar: Hidable(
          controller: scrollController,
          child: CatButton(
            ontaps: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryAdd(),
                  ));
            },
          )),
    );
  }
}
