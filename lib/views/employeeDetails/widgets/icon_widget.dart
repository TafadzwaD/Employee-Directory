import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  const IconContainer({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(17)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.teal,
              Colors.yellow,
            ],
          )),
      child:  Center(
        child: Icon(
          icon,
          color: Colors.black38,
        ),
      ),
    );
  }
}
