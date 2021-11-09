import 'dart:async';
import 'package:employee/controllers/employee_controller.dart';
import 'package:employee/models/employee_model.dart';
import 'package:employee/views/employeeList/employee_list_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        EmployeeController().fetchData().then((result) {
          List<Employee> _employeeData = EmployeeController()
              .employeesPaginatedList(
              start: 0, end:  50);
        return  Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) =>  EmployeeListScreen(initialEmployeeData: _employeeData,),),
          );


        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/launcherIcon/employeeDirectory.png'),
      ),
    );
  }
}
