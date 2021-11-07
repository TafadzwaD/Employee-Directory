import 'package:employee/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee details;

  const EmployeeDetailsScreen({Key? key, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),actions: [
          Text('yEST')
      ],
      ),
      body: Column(
        children: const <Widget>[

        ],
      ),
    );
  }
}
