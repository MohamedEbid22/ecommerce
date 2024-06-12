import 'package:flutter/material.dart';

class DiscountBord extends StatelessWidget {
  final String titel;
  final String body;

  const DiscountBord({super.key, required this.titel, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(200, 240, 86, 47),
                      Color.fromARGB(200, 255, 153, 0)
                    ]),
              ),
              child: ListTile(
                title: Text(
                  titel,
                  style: const TextStyle(
                      fontSize: 25, color: Color.fromARGB(211, 255, 255, 255)),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(210, 255, 255, 255),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
