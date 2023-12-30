// import 'dart:io';

// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class ViewDetails extends StatelessWidget {
//   int index;
//   var name;
//   var phone;
//   var place;

//   ViewDetails({
//     super.key,
//     required this.index,
//     required this.name,
//     required this.phone,
//     required this.place,

//   }) {
//     // TODO: implement ViewDetails
//     throw UnimplementedError();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.brown[600],
//           title: Text('Details'),
//         ),
//         body: Container(
//           color: Color.fromARGB(255, 255, 255, 255),
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // CircleAvatar(
//               //   radius: 75,
//               //   backgroundImage: FileImage(File(image)),
//               // ),
             
//               Text(name),
//               SizedBox(height: 10),
//               Text(phone),
//               SizedBox(height: 10),
//               Text(place)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
