// import 'package:flutter/material.dart';
// import 'package:ngo/pages/coming_soon.dart';
// import 'package:ngo/pages/food_donate.dart';
// import 'package:ngo/widgets/button.dart';
//
// class CategoryScreen extends StatefulWidget {
//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }
//
// class _CategoryScreenState extends State<CategoryScreen> {
//   int screenIndex = 0;
//
//   static List<Widget> screens = [
//     FoodDonation(),
//     Container(),
//     ComingSoon(),
//     ComingSoon(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Category'),
//         toolbarHeight: 60,
//       ),
//       body: screenIndex == 0 || screenIndex == 1
//           ? scrollingColumn()
//           : expandedColumn(),
//     );
//   }
//
//   Widget scrollingColumn() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               option(Icons.fastfood_outlined, 'Food', 0),
//               option(Icons.checkroom_outlined, 'Clothing', 1),
//               option(Icons.cast_for_education_outlined, 'Education', 2),
//               option(Icons.more_horiz_outlined, 'More', 3),
//             ],
//           ),
//           SizedBox(height: 18),
//           screens[screenIndex],
//         ],
//       ),
//     );
//   }
//
//   Widget expandedColumn() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             option(Icons.fastfood_outlined, 'Food', 0),
//             option(Icons.checkroom_outlined, 'Clothing', 1),
//             option(Icons.cast_for_education_outlined, 'Education', 2),
//             option(Icons.more_horiz_outlined, 'More', 3),
//           ],
//         ),
//         SizedBox(height: 18),
//         Expanded(child: screens[screenIndex]),
//         SizedBox(height: 10),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Button('Next', () {}),
//         ),
//       ],
//     );
//   }
//
//   Widget option(IconData iconData, String label, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           screenIndex = index;
//         });
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 60,
//             width: 60,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color:
//                   screenIndex == index ? Color(0xFF0f096d) : Color(0xFFE7E6FF),
//             ),
//             child: Icon(
//               iconData,
//               color:
//                   screenIndex == index ? Color(0xFFE7E6FF) : Color(0xFF0f096d),
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             label,
//             style: TextStyle(
//               color: Color(0xFF0f096d),
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
