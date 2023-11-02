// import 'package:flutter/material.dart';

// class Serach extends StatefulWidget {
//   const Serach({super.key});

//   @override
//   State<Serach> createState() => _SerachState();
// }

// class _SerachState extends State<Serach> {
//   String searchQuery = '';

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 350,
//       child: TextField(
//         autofocus: false,
//         // ...

//         onChanged: (value) {
//           setState(() {
//             searchQuery = value;
//           });
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/homepage/ItemView/serach_view.dart';

class Serach extends StatefulWidget {
  const Serach({super.key});

  @override
  State<Serach> createState() => _SerachState();
}

void navigateToProductSearchScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SearchViewPage(),
    ),
  );
}

class _SerachState extends State<Serach> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToProductSearchScreen(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(12),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(12)),
        child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '  Serach  ',
                style: TextStyle(color: Colors.black),
              ),
              Icon(Icons.search_rounded)
            ]),
      ),
    );
  }
}
