import 'package:flutter/material.dart';

class Vdivider extends StatelessWidget {
  const Vdivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Container(
      height: 40.0,
      width: 0.8,
      color: Colors.grey.shade400,
      margin: const EdgeInsets.only(left: 15.0, right: 15.0),);
  }
}
