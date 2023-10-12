import 'package:flutter/material.dart';

import 'package:giltezy_2ndproject/widgets/accounts/order/order_status.dart';
import 'package:giltezy_2ndproject/widgets/checkout/checkout_view.dart';
import 'package:pushable_button/pushable_button.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[800]),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckOut(),
            ));
      },
      child: const Text('Proceed to Check out',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
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