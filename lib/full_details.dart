import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FullDetails extends StatelessWidget {
  const FullDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = Get.arguments;

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: routes.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text('${routes[index]}'));
          },
        ),
      ),
    );
  }
}
