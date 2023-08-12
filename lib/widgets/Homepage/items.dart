// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/utils/theme/textstyle.dart';
import 'package:giltezy_2ndproject/widgets/Homepage/ItemView/item_view.dart';

class SecondGrid extends StatefulWidget {
  @override
  _SecondGridState createState() => _SecondGridState();
}

class _SecondGridState extends State<SecondGrid> {
  List<String> yourImagesList = [
    'assets/images/787-removebg-preview.png',
    'assets/images/65720-removebg-preview.png',
    'assets/images/65720-removebg-preview.png',
    'assets/images/787-removebg-preview.png',
    'assets/images/787-removebg-preview.png',
    'assets/images/65720-removebg-preview.png',
  ];

  List<Color> rowColors = [
    Colors.blue.shade200,
    Colors.green.shade200,
    Colors.orange.shade200,
    Colors.red.shade200,
  ]; // Define row colors

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemCount: yourImagesList.length,
      itemBuilder: (context, index) {
        final rowColor =
            rowColors[index % rowColors.length]; // Get the row color

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemViews(),
                  ));
            },
            child: Card(
              color: rowColor, // Set the row color as the background color
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        yourImagesList[index],
                        height: 150,
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        top: 0,
                        right: 3,
                        bottom: 190,
                        child: Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red[500],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'SAMSUNG -M 32',
                        style: kcdtext,
                      ),
                      const Text(
                        '\₹${2000}',
                        style: kxbutton,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
