import 'dart:convert';

import 'package:employee/models/employee_model.dart';
import 'package:flutter/services.dart';

class EmployeeController {
  fetchData({int start = 0, int end = 50}) async {
    try {
      String data = await rootBundle.loadString('assets/data/employees.json');
      List result = jsonDecode(data);

      List<Employee> employeeData =
          employeeList(result.getRange(0, 2).toList());

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
}
