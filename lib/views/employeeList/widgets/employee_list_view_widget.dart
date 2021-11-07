import 'package:employee/models/employee_model.dart';
import 'package:employee/views/employeeDetails/employee_details_screen.dart';
import 'package:flutter/material.dart';


class EmployeeListViewWidget extends StatelessWidget {
  final Employee employeeData;
  const EmployeeListViewWidget({Key? key, required this.employeeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmployeeDetailsScreen(details: employeeData),
          ),
        );
      },
      child: Row(
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          employeeData.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4 ,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, //Positions children near the start of the cross axis (horizontal)
            children: <Widget>[
              Text(employeeData.firstName + ' ' + employeeData.lastName,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,fontSize: 15, ),),
              const SizedBox(height: 5,),
              const Text('Job Role',style: TextStyle(color: Colors.black45,fontSize: 12),),
            ],
          )
        ],
      ),
    );
  }
}
