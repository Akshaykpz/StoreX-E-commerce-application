import 'package:flutter/material.dart';
import 'package:giltezy_2ndproject/service/wishlist_data.dart';

class CounterApp extends StatefulWidget {
  final String Id;
  CounterApp({Key? key, required this.Id}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counterInit = 1;

  void _incrementCounter() {
    setState(() {
      _counterInit++;
      ItemAdd().updatCount(widget.Id, _counterInit);
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counterInit > 0) {
        _counterInit--;
        ItemAdd().updatCount(widget.Id, _counterInit);
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
              onPressed: () {
                _decrementCounter();
              },
              color: Colors.red,
            ),
            Text(
              '$_counterInit',
              style: const TextStyle(fontSize: 24),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _incrementCounter();
              },
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
