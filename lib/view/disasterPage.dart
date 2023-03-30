import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DisasterPage extends StatelessWidget {
  const DisasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disaster Page"),
        backgroundColor: Color.fromARGB(255, 49, 168, 215),
      ),
      body:const Center(
        child: Text(
          "Will be updated soon!!!",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
