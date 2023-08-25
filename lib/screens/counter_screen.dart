// import 'package:flutter/material.dart';
// import 'package:shop/provider/counter.dart';

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({
//     super.key,
//   });

//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Contador"),
//       ),
//       body: Row(
//         children: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 CounterProvider.of(context)?.state.dec();
//               });
//             },
//             icon: Icon(Icons.remove),
//           ),
//           Text(CounterProvider.of(context)?.state.value.toString() ?? "0"),
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 CounterProvider.of(context)?.state.inc();
//               });
//             },
//             icon: Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }
