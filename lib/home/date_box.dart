// import 'package:exp_note/form/form_services.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DateBox extends StatefulWidget {
//   final String dateNumber;
//   final String dayName;

//   const DateBox({
//     Key? key,
//     required this.dateNumber,
//     required this.dayName,
//   }) : super(key: key);

//   @override
//   State<DateBox> createState() => _DateBoxState();
// }

// class _DateBoxState extends State<DateBox> {
//   final FormServices formServices = Get.put(FormServices());

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         formServices.getExp("${widget.dateNumber}-08-2022");
//       },
//       child: Container(
//         width: 60,
//         height: 60,
//         padding: const EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           color: const Color(0xaaaaaaaa),
//           border: Border.all(),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               widget.dateNumber,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(widget.dayName),
//           ],
//         ),
//       ),
//     );
//   }
// }
