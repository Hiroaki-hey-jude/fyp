import 'package:flutter/material.dart';

import '../../model/category_model/category_model.dart';

// class Categories extends StatelessWidget {
//   const Categories({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//             category_list.length,
//             (index) => Padding(
//                   padding: const EdgeInsets.only(right: 3),
//                   child: categoryCard(
//                     icon: category_list[index].icon,
//                     title: category_list[index].title,
//                     press: () {},
//                   ),
//                 )),
//       ),
//     );
//   }
// }

// class categoryCard extends StatelessWidget {
//   const categoryCard({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.press,
//   });

//   final String icon, title;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 115,
//       height: 60,
//       margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//           Radius.circular(10),
//         ))),
//         onPressed: press,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//           child: Column(
//             children: [
//               Image.asset(
//                 icon,
//                 width: 40,
//                 height: 30,
//               ),
//               const SizedBox(height: 3),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 17,
//                   color: Colors.black,
//                 ),
//               )
//               // SvgPicture.asset(
//               //   "assets/tomato.svg",
//               // ),
//               // SvgPicture.assets
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
