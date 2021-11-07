import 'package:flutter/material.dart';


class EmployeeAvatar extends StatelessWidget {
  final String imageUrl;
  const EmployeeAvatar({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                Border.all(width: 3, color: Colors.black12)),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            imageUrl),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 80,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 3, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
