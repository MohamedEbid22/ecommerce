import 'package:flutter/material.dart';

class ButtonProdeuct extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const ButtonProdeuct(
      {super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 30, left: 40, right: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(192, 243, 85, 46)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          "${textbutton}",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
