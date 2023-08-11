import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';

class CounterCart extends StatefulWidget {
  const CounterCart({super.key});

  @override
  State<CounterCart> createState() => _CounterCartState();
}

class _CounterCartState extends State<CounterCart> {
  int? _counter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 36),
      child: CartStepperInt(
        value: _counter,
        size: 24,
        axis: Axis.vertical,
        style: CartStepperTheme.of(context).copyWith(
          activeBackgroundColor: Colors.white,
          activeForegroundColor: Colors.blue,
        ),
        didChangeCount: (count) {
          setState(() {
            _counter = count;
          });
        },
      ),
    );
  }
}
