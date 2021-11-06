import 'package:employee/views/employeeList/dashed_line_widget.dart';
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
      body: Column(
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
                return Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.1, color: Colors.black54),
                        ),
                        child: Container(
                          width: 73,
                          height: 73,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://hub.dummyapis.com/Image?text=KA&height=120&width=120'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2 ,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //Positions children near the start of the cross axis (horizontal)
                      children: const <Widget>[
                        Text('FirstName + LastName',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,fontSize: 15, ),),
                        SizedBox(height: 5,),
                        Text('Job Role',style: TextStyle(color: Colors.black45,fontSize: 12),),
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: DashedLine(),
                );
              },
              itemCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
