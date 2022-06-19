//
// import 'package:flutter/material.dart';
//
// import '../../componants/components.dart';
// import '../../models/address_list.dart';
// import '../Buy_conform_screen/Buy_conform_screen.dart';
//
// class Addresswidget extends StatelessWidget {
//   final AddAddress_list address;
//   Addresswidget({
//   required this.address
//   });
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData size = MediaQuery.of(context);
//
//     return InkWell(
//       onTap: ()
//       {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => BuyConformScreen()));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Container(
//           height: size.size.height * .20,
//           width: size.size.width * 1,
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                     children: [
//                       Text('${address.label}',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),),
//                       Expanded(child: SizedBox(width: 0,)),
//                       icontext(
//                         onTap: (){},
//                         icon: Icons.remove,
//                         Textt: 'Remove',
//                       ),
//
//                     ]
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
//                 child: Text('${address.StreetName}',),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//                 child: Text('${address.ApartmentNumber} ,${address.FloorNumber} ,${address.BuildingNumber}'),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('Mobile: ${address.MobileNumber}'),
//               ),
//
//             ],
//           ),
//         ),
//       )
//
//
//     );
//   }
// }