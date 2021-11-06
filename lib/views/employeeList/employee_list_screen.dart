import 'package:employee/controllers/employee_controller.dart';
import 'package:employee/models/employee_model.dart';
import 'package:employee/views/employeeList/widgets/dashed_line_widget.dart';
import 'package:employee/views/employeeList/widgets/employee_list_view_widget.dart';
import 'package:flutter/material.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> _employeeData = [];
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    EmployeeController().fetchData().then((result){
      setState(() {
        _employeeData = result;
        _isLoading = false;
      });
    });
    super.initState();
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
      body:!_isLoading ? Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                  hintText: 'Search Employee',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.black54),
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
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const EmployeeListViewWidget();
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(80, 2, 30,10),
                  child: DashedLine(),
                );
              },
              itemCount: _employeeData.length,
            ),
          )
        ],
      ): const Center(child: CircularProgressIndicator()),
    );
  }
}
