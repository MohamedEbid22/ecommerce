import 'package:flutter/material.dart';

class addressshar extends StatelessWidget {
  final String titlename;
  final String subtitle;
  final bool active;

  const addressshar(
      {super.key,
      required this.titlename,
      required this.subtitle,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
        side: BorderSide(color: Colors.orange),
      ),
      child: const ListTile(
        title: Text(""),
        subtitle: Text("kafr_elshak_elzeraa"),
      ),
    );
  }
}
