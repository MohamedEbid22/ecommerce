import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      required this.hintText,
      required this.label,
      required this.suffixIcon,
      this.mycontroller,
      required this.valed,
      required this.isNum,
      this.obscureText,
      this.onTap,
      this.onsaved});
  final String hintText;
  final String label;
  final IconData suffixIcon;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valed;
  final bool isNum;
  final bool? obscureText;
  final Function()? onTap;
  final Function(String?)? onsaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 36, right: 36, top: 35),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNum
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valed,
        onSaved: onsaved,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: "$hintText",
            hintStyle: TextStyle(fontSize: 14, color: colorApp.grey),
            suffixIcon: InkWell(
              onTap: onTap,
              child: Icon(
                suffixIcon,
                color: colorApp.orange,
              ),
            ),
            label: Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "$label",
                style: TextStyle(fontSize: 23, color: colorApp.orange),
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
