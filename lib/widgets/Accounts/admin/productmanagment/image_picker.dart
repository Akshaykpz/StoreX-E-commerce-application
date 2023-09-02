import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(border: Border.all()),
        width: MediaQuery.of(context).size.width * 0.7,
        height: 200,
      ),
      Positioned(
          bottom: 1,
          left: 20,
          right: 20,
          child: IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {},
          ))
    ]);
  }
}
