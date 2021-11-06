import 'package:employee/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee details;
  const EmployeeDetailsScreen({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: const <Widget>[
          Text('Hello'),
        ],
      ),
    );
  }
}
