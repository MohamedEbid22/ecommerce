import 'package:flutter/material.dart';

class BodyAuth extends StatelessWidget {
  const BodyAuth({super.key, required this.body});
  final String body;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$body",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Color.fromARGB(255, 242, 242, 242), fontSize: 15, height: 1.8),
      textAlign: TextAlign.center,
    );
  }
}
