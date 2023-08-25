import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/widgets/Accounts/order/order_text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderDetiles extends StatelessWidget {
  final bool isfrist;
  final bool islast;
  final bool ispast;
  // ignore: prefer_typing_uninitialized_variables
  final texts;
  const OrderDetiles(
      {super.key,
      required this.isfrist,
      required this.islast,
      required this.ispast,
      required this.texts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: TimelineTile(
        beforeLineStyle: const LineStyle(
          color: Colors.teal,
        ),
        indicatorStyle: IndicatorStyle(
            color: Colors.teal,
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
