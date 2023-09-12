import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  Color.fromRGBO(230, 157, 157, 1),
                  Color(0xFFF6EFE9)
                ]),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .15,
            height: 200,
            left: 10,
            right: 10,
            child: FlipCard(
              controller: _controller,
              fill: Fill.fillBack,
              direction: FlipDirection.HORIZONTAL,
              side: _isFlipped ? CardSide.BACK : CardSide.FRONT,
              front: Container(
                color: Colors.pink.shade50,
                child: const Center(),
              ),
              back: Container(
                color: Colors.pink.shade50,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Welcome ....',
                        style: GoogleFonts.gabriela(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text(
                        'Akshay-kp',
                        style: GoogleFonts.gabriela(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
