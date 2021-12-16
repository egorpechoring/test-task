import 'package:flutter/material.dart';
import 'package:test_task_north_coast_code/widgets/data_display.dart';

class PersonalInfo extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const PersonalInfo(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 12),
      child: Column(
        children: [
          DataDisplay(title: "FIRST NAME",txt: firstName),
          DataDisplay(title: "LAST NAME",txt: lastName),
          DataDisplay(title: "E-MAIL",txt: email),
          DataDisplay(title: "PHONE",txt: phone),
        ],
      ),
    );
  }
}
