import 'package:flutter/material.dart';

import '../../shared/constant.dart';

const sellTextInputDecoration = InputDecoration(
  // cursorColor: Colors.black,
  labelStyle:
      TextStyle(color: Constant.blackColor, fontWeight: FontWeight.w300),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Constant.blackColor, width: 1),
  ),
  // enabledBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: Constant.blackColor, width: 1),
  // ),
);

class GreyDescription extends StatelessWidget {
  const GreyDescription({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 0),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Color.fromARGB(255, 79, 77, 77),
        ),
      ),
    );
  }
}
