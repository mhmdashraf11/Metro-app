// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class FullDetails extends StatelessWidget {
//   const FullDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final routes = Get.arguments as List<List<String>>;
//
//     return SafeArea(
//       child: Scaffold(
//         body: ListView.builder(
//           itemCount: routes.length,
//           itemBuilder: (context, index) {
//             return ListTile(title: Text('${routes[index]}'));
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'functions.dart';

class FullDetails extends StatelessWidget {
  const FullDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = Get.arguments as List<List<String>>;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Routes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: Color(0xFFc41014),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, i) {
          final title = 'Route ${i + 1}';
          final route = routes[i];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ExpansionTile(
              title: Text(title),
              subtitle: Text(
                '${route.length} stops . ${Metro().expectedTimeMin(route)} min . ${Metro().fareEGP(route)}\$',
              ),
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),

              children: [
                ...List.generate(
                  route.length,
                  (idx) => ListTile(
                    leading: Text((idx + 1).toString().padLeft(2, '0')),
                    title: Text(route[idx]),
                    dense: true,
                  ),
                ),

                // const SizedBox(height: 6),
              ],
            ),
          );
        },
      ),
    );
  }
}
