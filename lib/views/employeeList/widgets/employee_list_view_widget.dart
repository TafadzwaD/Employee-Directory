import 'package:flutter/material.dart';


class EmployeeListViewWidget extends StatelessWidget {
  const EmployeeListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 0.1, color: Colors.black54),
            ),
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://hub.dummyapis.com/Image?text=KA&height=120&width=120'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4 ,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, //Positions children near the start of the cross axis (horizontal)
          children: const <Widget>[
            Text('FirstName + LastName',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,fontSize: 15, ),),
            SizedBox(height: 5,),
            Text('Job Role',style: TextStyle(color: Colors.black45,fontSize: 12),),
          ],
        )
      ],
    );
  }
}
