import 'package:flutter/material.dart';

class IconAuth extends StatelessWidget {
  const IconAuth({super.key, required this.iconauth});
  final IconData iconauth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        iconauth,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
