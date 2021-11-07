import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final LinearGradient gradient;
  const IconContainer({Key? key, required this.icon,required this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration:  BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(17)),
          gradient: gradient),
      child:  Center(
        child: Icon(
          icon,
          color: Colors.black38,
        ),
      ),
    );
  }
}
