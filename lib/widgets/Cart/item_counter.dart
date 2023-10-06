import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counterInit = 0;

  void _incrementCounter() {
    setState(() {
      _counterInit++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counterInit > 0) {
        _counterInit--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: _decrementCounter,
              color: Colors.red,
            ),
            Text(
              '$_counterInit',
              style: const TextStyle(fontSize: 24),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _incrementCounter,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
