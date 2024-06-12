import 'package:flutter/material.dart';

class TitelHome extends StatelessWidget {
  final String text;
  const TitelHome({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 22,
            color: Color.fromARGB(200, 243, 135, 11),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
