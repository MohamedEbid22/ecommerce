import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';

class Appar extends StatelessWidget {
  final String titeltext;
  final void Function()? onPressedsearch;
  final void Function()? onPressedfavert;
  final void Function(String)? onChanged;
  final TextEditingController Mycontroller;

  const Appar(
      {super.key,
      required this.titeltext,
      required this.onPressedsearch,
      required this.onPressedfavert,
      this.onChanged,
      required this.Mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                height: 40,
                child: TextFormField(
                  controller: Mycontroller,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: titeltext,
                    hintStyle:
                        const TextStyle(fontSize: 14, color: colorApp.grey),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    filled: true,
                    fillColor: const Color.fromARGB(226, 209, 209, 209),
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: colorApp.orange,
                        size: 25,
                      ),
                      onPressed: onPressedsearch,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(0, 255, 255,
                            255), // Change the color of the outer frame here
                        width: 0, // Set width to 0 to remove the outer frame
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              )),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: const Color.fromARGB(226, 209, 209, 209),
            ),
            child: Expanded(
                flex: 1,
                child: Container(
                    child: IconButton(
                  onPressed: onPressedfavert,
                  icon: const Icon(
                    Icons.favorite_border,
                    color: colorApp.orange,
                    size: 25,
                  ),
                ))),
          )
        ],
      ),
    );
  }
}
