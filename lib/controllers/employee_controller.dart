import 'dart:convert';

import 'package:employee/models/employee_model.dart';
import 'package:employee/utilities/utilities.dart';
import 'package:flutter/services.dart';

int _totalNumberOfEmployees = 0;
List _sortedEmployeeList = [];
Map<String, int > _alphabetContactMap = {};

class EmployeeController {
   fetchData({int start = 0, int end = 50}) async {
    try {
      String data = await rootBundle.loadString('assets/data/employees.json');

      List result = jsonDecode(data);
      result.sort((a, b) {
        return a['firstName']
            .toLowerCase()
            .compareTo(b['firstName'].toLowerCase());
      });
      _totalNumberOfEmployees = result.length;
      _sortedEmployeeList = result;

       //

      mapAlphabetLetterToFirstEmployeeFirstName(employees: employeeList(result.getRange(0, _totalNumberOfEmployees).toList()));

      // return employeeData;
    } catch (error) {
      _sortedEmployeeList = [];
    }
  }

  List<Employee> employeesPaginatedList({int start = 0, int end = 50}){
    List<Employee> employeeData =
    employeeList( _sortedEmployeeList.getRange(start, end).toList());
    return employeeData;
  }

  List<Employee> employeeList(List data) {
    List<Employee> _employees = [];
    for (var employee in data) {
      _employees.add(Employee.fromJson(employee));
    }
    return _employees;
  }

  //Function creates a map with each alphabet letter as key and the first employee's index as key... Employees list should supplied already sorted by firstName
  mapAlphabetLetterToFirstEmployeeFirstName({required List<Employee> employees}) {
    Map<String, int> alphabetMap = {};
    for (var letter in alphabet) {
      alphabetMap[letter] = employees.indexWhere(
        (element) => element.firstName.toLowerCase().startsWith(
              letter.toLowerCase(),
            ),
      );
    }

    _alphabetContactMap = alphabetMap;


  }

  int get totalNumberOfEmployees => _totalNumberOfEmployees;
   Map<String, int> get alphabetContactMap => _alphabetContactMap;
}
