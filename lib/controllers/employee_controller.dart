import 'dart:convert';

import 'package:employee/models/employee_model.dart';
import 'package:flutter/services.dart';

int _totalNumberOfEmployees = 0 ;
class EmployeeController {

 Future <List<Employee>> fetchData({int start = 0, int end = 50}) async {
    try {
      String data = await rootBundle.loadString('assets/data/employees.json');

      List result = jsonDecode(data);
      result.sort((a, b) {
        return a['firstName'].toLowerCase().compareTo(b['firstName'].toLowerCase());});
      _totalNumberOfEmployees = result.length;

      List<Employee> employeeData =
          employeeList(result.getRange(start, end).toList()); //

      return employeeData;
    } catch (error) {
      return [];
    }
  }

  List<Employee> employeeList(List data) {
    List<Employee> _employees = [];
    for (var employee in data) {
      _employees.add(Employee.fromJson(employee));
    }
    return _employees;
  }

  int get totalNumberOfEmployees => _totalNumberOfEmployees;
}
