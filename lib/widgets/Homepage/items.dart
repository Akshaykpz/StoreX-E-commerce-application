import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/ItemView/item_view.dart';

class SecondGrid extends StatefulWidget {
  @override
  _SecondGridState createState() => _SecondGridState();
}

class _SecondGridState extends State<SecondGrid> {
  List<String> yourImagesList = [
    'assets/images/787-removebg-preview.png',
    'assets/images/65720-removebg-preview.png',
    'assets/images/logo.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemCount: yourImagesList.length * 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemViews(),
                  ));
            },
            child: Card(
              color: Colors.black,
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
                      (index % 2 == 0
                          ? Image.asset(
                              yourImagesList[0],
                              height: 120,
                              fit: BoxFit.fitWidth,
                            )
                          : Image.asset(
                              yourImagesList[1],
                            )),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red[500],
                                )),
                          ))
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'SAMSUNG -M 32',
                        style: TextStyle(fontSize: 12, color: Colors.lightBlue),
                      ),
                      Text(
                        '\₹${2000}',
                        style: TextStyle(fontSize: 19, color: Colors.teal),
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
