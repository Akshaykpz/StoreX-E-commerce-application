// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // class Chipadd extends StatelessWidget {
// //   final String label;
// //   final Color? colrs;
// //   final String? image; // Step 1: Add the image parameter
// //   const Chipadd({
// //     super.key,
// //     required this.label,
// //     this.colrs,
// //     this.image, // Step 2: Pass the image parameter in the constructor
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
// //       child: Container(
// //         alignment: Alignment.center,
// //         decoration: BoxDecoration(
// //             borderRadius: const BorderRadius.all(Radius.circular(10)),
// //             border: Border.all(
// //               width: 1.5,
// //               color: Colors.black54,
// //               style: BorderStyle.solid,
// //             )),
// //         height: 38.h,
// //         width: 90.w,
// //         child: Text(label,
// //             style: TextStyle(
// //                 fontWeight: FontWeight.w500,
// //                 fontSize: 18,
// //                 color: Colors.black)),
// //         // label: Text(label,
// //         // style: TextStyle(
// //         //     fontWeight: FontWeight.w300,
// //         //     fontSize: 22,
// //         //     color: Colors.black)),
// //         // backgroundColor: Colors.white,
// //         // avatar:
// //         //     image != null // Step 3: Display the image as the avatar of the Chip
// //         //         ? CircleAvatar(
// //         //             backgroundImage: AssetImage(
// //         //                 image!), // Use AssetImage for local images or NetworkImage for remote images
// //         //           )
// //         //         : null,
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Chipadd extends StatelessWidget {
//   final String label;
//   final Color? borderColor;
//   final String? image;
//   final String? color;

//   const Chipadd(
//       {Key? key,
//       required this.label,
//       this.borderColor, // Use borderColor instead of colrs
//       this.image,
//       this.color})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
//       child: Container(
//         padding: EdgeInsets.only(left: 4, right: 14),
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(12)),
//           border: Border.all(
//             width: 1,
//             color: borderColor ?? Colors.black54, // Set the border color
//             style: BorderStyle.solid,
//           ),
//           color: Colors.white, // Set the constant background color
//         ),
//         child: Row(
//           children: [
//             if (image != null)
//               CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 backgroundImage: AssetImage(image!),
//                 radius: 18,
//               ),
//             SizedBox(width: 5.w),
//             Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chipadd extends StatelessWidget {
  final String label;
  final Color? borderColor;
  final String? image;
  final bool isSelected; // Add a boolean to determine if the chip is selected
  final Color selectedColor;

  const Chipadd(
      {Key? key,
      required this.label,
      this.borderColor,
      this.image,
      this.isSelected = false, // Default to not selected
      this.selectedColor = Colors.blue
// Default color for selected chip
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected ? selectedColor : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: Container(
        padding: const EdgeInsets.only(left: 4, right: 14),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            width: 1,
            color: borderColor ?? Colors.black54,
            style: BorderStyle.solid,
          ),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            if (image != null)
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(image!),
                radius: 18,
              ),
            SizedBox(width: 5.w),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
