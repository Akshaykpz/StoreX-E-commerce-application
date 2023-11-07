import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/accounts/order/order_text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderDetiles extends StatelessWidget {
  final bool isfrist;
  final bool islast;
  final bool ispast;
  // ignore: prefer_typing_uninitialized_variables
  final String texts;
  const OrderDetiles(
      {super.key,
      required this.isfrist,
      required this.islast,
      required this.ispast,
      required this.texts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: TimelineTile(
        beforeLineStyle: LineStyle(
          color: ispast ? Colors.teal : Colors.teal.shade100,
        ),
        indicatorStyle: IndicatorStyle(
            color: ispast ? Colors.teal : Colors.teal.shade100,
            width: 40,
            iconStyle: IconStyle(iconData: Icons.done, color: Colors.white)),
        isFirst: isfrist,
        isLast: islast,
        endChild: OrderText(
          child: texts,
        ),
      ),
    );
  }
}
