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
      if (_counterInit > 1) {
        _counterInit--;
        ItemAdd().updatCount(widget.Id, _counterInit);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                child: InkWell(
                  onTap: () {
                    _decrementCounter();
                  },
                  focusColor: Colors.red,
                  child: const Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  '$_counterInit',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
                height: 25,
                width: 25,
                child: InkWell(
                  child: const Icon(Icons.add),
                  onTap: () {
                    _incrementCounter();
                  },
                  focusColor: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
