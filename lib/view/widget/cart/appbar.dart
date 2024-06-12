import 'package:flutter/material.dart';

class AppBarC extends StatelessWidget {
  final String titel;
  final void Function()? onPressed;
  const AppBarC({super.key, required this.titel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 20,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Center(
            child: Container(
              width: 130,
              child: Text(
                "${titel}",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
