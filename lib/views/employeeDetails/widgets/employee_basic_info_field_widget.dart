import 'package:employee/views/employeeList/widgets/dashed_line_widget.dart';
import 'package:flutter/material.dart';

class EmployeeInformationField extends StatelessWidget {
  final String fieldTitle;
  final String fieldValue;

  const EmployeeInformationField(
      {Key? key, required this.fieldTitle, required this.fieldValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
        child: SizedBox(
          child: DashedLine(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 10, right: 8),
        child: Row(
          children: [
            Text(
              fieldTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black54),
            ),
            const Spacer(),
            Text(
              fieldValue,
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.black54),
            ),
          ],
        ),
      ),
    ]);
  }
}
