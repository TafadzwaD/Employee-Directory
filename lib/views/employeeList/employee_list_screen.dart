import 'package:flutter/material.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Transform.scale(
            scale: 1.2,
            child: const Icon(
              Icons.menu,
              color: Colors.black54,
            ),
          ),
        ),
        title: const Text(
          'Employee Directory',
          style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.bold,height: 2),
        ),
      ),
    );
  }
}
