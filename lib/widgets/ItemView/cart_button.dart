// import 'package:flutter/material.dart';
// import 'package:flutter_animated_button/flutter_animated_button.dart';

// class AnimatedButtonDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var submitTextStyle = TextStyle(
//       fontSize: 28,
//       letterSpacing: 5,
//       color: Colors.white,
//       fontWeight: FontWeight.w300,
//     );

//     return Column(
//       children: [
//         SizedBox(height: 20), // Add spacing if needed

//         AnimatedButton(
//           animatedOn: AnimatedOn.onHover,
//           onPress: () {},
//           onChanges: (change) {},
//           height: 70,
//           width: 200,
//           text: 'SUBMIT',
//           isReverse: true,
//           selectedTextColor: Colors.black,
//           transitionType: TransitionType.LEFT_TOP_ROUNDER,
//           textStyle: submitTextStyle,
//           backgroundColor: Colors.black,
//           selectedBackgroundColor: Colors.lightGreen,
//           borderColor: Colors.white,
//           borderWidth: 1,
//         ),

//         SizedBox(height: 20), // Add spacing if needed

//         AnimatedButton.strip(
//           animatedOn: AnimatedOn.onHover,
//           height: 70,
//           width: 200,
//           text: 'SUBMIT',
//           isReverse: true,
//           selectedTextColor: Colors.black,
//           textStyle: submitTextStyle,
//           backgroundColor: Colors.black,
//           onPress: () {},
//         ),

//         // ... other AnimatedButton widgets

//         // ... other components or widgets if needed
//       ],
//     );
//   }
// }
