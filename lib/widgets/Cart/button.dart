import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/checkout/check_out_view_page.dart';
import 'package:page_transition/page_transition.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[800]),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: const CheckOutPage()));
        },
        child: const Text('Proceed to Check out',
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
      ),
    );
  }
}

//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               onPrimary: Colors.white,
//               primary: Colors.cyan[300],
//               minimumSize: const Size(88, 36),
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(2)),
//               ),
//             ),
//             child: const Text('Elevated Button'),
//           ),