import 'dart:async';

import 'package:employee/controllers/employee_controller.dart';
import 'package:employee/models/employee_model.dart';
import 'package:employee/views/employeeList/widgets/dashed_line_widget.dart';
import 'package:employee/views/employeeList/widgets/employee_list_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EmployeeListScreen extends StatefulWidget {
  final List<Employee> initialEmployeeData;
  const EmployeeListScreen({Key? key, required this.initialEmployeeData}) : super(key: key);

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> _employeeData = [];
  final _scrollController = ScrollController();

  bool _isLoadingMoreData = false;
  bool _allEmployeesDataFetched = false;

  void fetchMoreData() {
    if (_employeeData.length < EmployeeController().totalNumberOfEmployees) //
    {
      List<Employee> _newEmployeeData = EmployeeController()
          .employeesPaginatedList(
              start: _employeeData.length, end: _employeeData.length + 50);

      Timer(
          const Duration(seconds: 2),
              () {

                setState(() {
                  _employeeData = [..._employeeData, ..._newEmployeeData];
                  _isLoadingMoreData = false;
                });
          }
      );

    } else {
      setState(() {
        _isLoadingMoreData = false;
        _allEmployeesDataFetched = true;
      });
    }
  }

  //Responsible for scrolling to first element of Alphabetical order grouping
  void scrollTo({required String letter}) {
    int indexOfLetterSelected =
        EmployeeController().alphabetContactMap[letter] as int;

    // If indexofLetterSelected is less than length of employeeData then the alphabet grouping has been fetched..
    if (indexOfLetterSelected < _employeeData.length) {
      _scrollController.animateTo(
        indexOfLetterSelected * 93,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 100),
      );
    }
  }

  @override
  void initState() {

    _employeeData = widget.initialEmployeeData;

    _scrollController.addListener(() {

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _isLoadingMoreData = true;
        });
        fetchMoreData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              height: 2),
        ),
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey.shade200,
              height: 1,
            ),
            preferredSize: const Size.fromHeight(2.0)),
      ),
      body:  Column(

              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: 'Search Employee',
                        hintStyle:
                            TextStyle(fontSize: 13, color: Colors.black54),
                        isDense: true,
                        // use less vertical space..
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ListView.separated(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (index < _employeeData.length) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // check if employee is the first in their grouping in alphabetical order based on firstName. Display first character of firstname if that is the case or empty container
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 20),
                                    child: EmployeeController()
                                            .alphabetContactMap
                                            .values
                                            .contains(index)
                                        ? Text(
                                            _employeeData[index]
                                                .firstName
                                                .characters
                                                .first,
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : Container(),
                                  ),
                                  SizedBox(
                                    height: 60,
                                    child: EmployeeListViewWidget(
                                      employeeData: _employeeData[index],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: Text(
                                  'All Data Has Been Fetched',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              );
                            }
                          },
                          separatorBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.fromLTRB(80, 2, 30, 10),
                              child: DashedLine(),
                            );
                          },
                          itemCount: _employeeData.length +
                              (_allEmployeesDataFetched ? 1 : 0),
                        ),
                      ),
                      _isLoadingMoreData
                          ? const Align(
                              alignment: Alignment.bottomCenter,
                              child: CircularProgressIndicator(),
                            )
                          : Container(),
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                               SingleChildScrollView(

                                 child: Column(
                                  children: [
                              SizedBox(
                                width: 20,
                                height: MediaQuery.of(context).size.height - 200,
                                child: ListView(
                                shrinkWrap: true,
                                primary: false,
                                children: [
                                  for (var letter in EmployeeController()
                                      .alphabetContactMap
                                      .keys)
                                    InkWell(
                                      onTap: () {
                                        scrollTo(letter: letter);
                                      },
                                      child: Text(
                                        letter,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    ),

                                ],

                              ),)
                                  ],
                              ),
                               ),

                        ),
                      ),
                    ],
                  ),
                )
              ],
            )

    );
  }
}
