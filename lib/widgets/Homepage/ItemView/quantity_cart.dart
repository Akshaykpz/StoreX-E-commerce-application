import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';

class QuantiyPage extends StatefulWidget {
  const QuantiyPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QuantiyPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QuantiyPage> {
  int _counter = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
          width: 130,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: CartStepperInt(
                value: _counter,
                size: 19,
                style: CartStepperStyle(
                  elevation: 2,
                  foregroundColor: Colors.black,
                  activeForegroundColor: Colors.black,
                  activeBackgroundColor: Colors.grey.shade200,
                  buttonAspectRatio: 1.7,
                ),
                didChangeCount: (count) {
                  setState(() {
                    _counter = count;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
