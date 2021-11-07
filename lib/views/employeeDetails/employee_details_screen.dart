import 'package:employee/models/employee_model.dart';
import 'package:employee/views/employeeDetails/widgets/employee_avatar_widget.dart';
import 'package:employee/views/employeeDetails/widgets/icon_widget.dart';
import 'package:employee/views/employeeDetails/widgets/vdivider_widget.dart';
import 'package:employee/views/employeeList/widgets/dashed_line_widget.dart';
import 'package:flutter/cupertino.dart';
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
        backgroundColor: Colors.white,
        leading: Transform.scale(
          scale: 1.3,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.black54,
            ),
          ),
        ),
        actions: [
          Transform.scale(
            scale: 1.3,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_sharp,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                    top: -60,
                    child: EmployeeAvatar(
                      imageUrl: details.imageUrl,
                    )),
                SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 200,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: DashedLine(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        child: Column(
                          children: [
                            Text(
                              (details.firstName + '' + ' ' + details.lastName),
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Flutter Developer @Emporium',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [

                              IconContainer(icon: Icons.phone,gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.teal,
                                  Colors.yellow,
                                ],
                              ),),
                              // const VerticalDivider(width: 30,),
                              Vdivider(),

                              IconContainer(icon: Icons.phone_android, gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.teal,
                                  Colors.yellow,
                                ],
                              ),)
,

                              Vdivider(),
                              IconContainer(icon: Icons.email, gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.teal,
                                  Colors.yellow,
                                ],
                              ),),

                            ],
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 200,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: DashedLine(),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: DashedLine(),
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: DashedLine(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(15),
            child: Text('Basic Information',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Stack(
                  children:[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 40,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: DashedLine(),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 40,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: DashedLine(),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 17.5),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          height: 40,
                          child: DashedLine(),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child:  SizedBox(
                        child: DashedLine(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 10,right: 8),
                      child: Row(
                        children: const [
                          Text('Designation',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54
                          ),),
                          Spacer(),
                          Text('Designer',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black54
                          ),),
                        ],
                      ),
                    ),

                  ]
                ),
                Stack(
                    children:[
                      const Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 40,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: DashedLine(),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          height: 40,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: DashedLine(),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 17.5),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            height: 40,
                            child: DashedLine(),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child:  SizedBox(
                          child: DashedLine(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 10,right: 8),
                        child: Row(
                          children: const [
                            Text('Designation',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54
                            ),),
                            Spacer(),
                            Text('Designer',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black54
                            ),),
                          ],
                        ),
                      ),

                    ]
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}
