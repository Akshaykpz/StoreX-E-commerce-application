import 'dart:async';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class AppbarUi extends StatefulWidget {
  const AppbarUi({super.key});

  @override
  State<AppbarUi> createState() => _AppbarUiState();
}

class _AppbarUiState extends State<AppbarUi> {
  final FlipCardController _controller = FlipCardController();
  bool _isFlipped = false;
  Timer? _timer;
  final int _flipInterval = 2; // Flip interval in seconds

  @override
  void initState() {
    super.initState();
    _startFlipping();
  }

  void _startFlipping() {
    _timer = Timer.periodic(Duration(seconds: _flipInterval), (timer) {
      if (!_isFlipped) {
        _controller.toggleCard();
        _isFlipped = true;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30, //70 for bottom
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 70, // to shift little up
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(228, 143, 143, 1),
                  Color.fromARGB(255, 232, 223, 216)
                ]),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: const Center(
                  child: Text(
                "Admin Panel",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
