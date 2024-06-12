import 'package:flutter/material.dart';

class contenercaev extends StatelessWidget {
  final double? h1;
  final double? h2;
  final Color? c1;
  final Color? c2;
  final double? carve;

  const contenercaev(
      {super.key,
      required this.h1,
      required this.h2,
      required this.c1,
      required this.c2,
      required this.carve});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: h1,
      width: double.infinity,
      color: c1,
      child: Container(
        height: h2,
        decoration: BoxDecoration(
          color: c2,
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(
              MediaQuery.of(context).size.width,
              carve!,
            ),
          ),
        ),
      ),
    );
  }
}
