import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/categories/category_images.dart';
import 'package:giltezy_2ndproject/widgets/categories/catgory_items.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryList> categoryview = const [
      CategoryList(imageyrl: 'assets/images/Apple-Logo.png', text: 'Apple'),
      CategoryList(imageyrl: 'assets/images/Xiaomi-logo.jpg', text: 'Xiaomi'),
      CategoryList(imageyrl: 'assets/images/OnePlus-logo.jpg', text: 'Oneplus'),
      CategoryList(imageyrl: 'assets/images/Huawei-logo.jpg', text: 'Huawei'),
      CategoryList(imageyrl: 'assets/images/Samsung-logo.jpg', text: 'Samsung'),
      CategoryList(
          imageyrl: 'assets/images/Screenshot 2023-08-07 010809.png',
          text: 'Poco'),
      CategoryList(imageyrl: 'assets/images/OPPO-logo.jpg', text: 'Oppo'),
      CategoryList(imageyrl: 'assets/images/Vivo-logo.jpg', text: 'Vivo'),
      CategoryList(imageyrl: 'assets/images/Lenovo-logo.jpg', text: 'Lenovo'),
      CategoryList(imageyrl: 'assets/images/Nokia-Logo.png', text: 'Nokia')
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Category Items',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 350.0,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 4,
        ),
        itemCount: categoryview.length,
        itemBuilder: (context, index) {
          final data = categoryview[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryViewPage(),
                  ));
            },
            child: Card(
              // color: Colors.red,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(1.0),
                child: Center(
                  child: GridTile(
                    footer: Text(
                      data.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Image.asset(data.imageyrl),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
