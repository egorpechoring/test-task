import 'package:flutter/material.dart';

class DataDisplay extends StatelessWidget {
  final String title;
  final String txt;

  const DataDisplay({
    Key? key,
    required this.title,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double p = MediaQuery.of(context).size.width / 24;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 17, 60, 81),
            width: 1,
          ),
        ),
      ),
      child: Padding(
          padding: EdgeInsets.only(
            top: p,
            bottom: p,
            left: p / 3.75,
            right: p / 3.75,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(txt),
          ])),
    );
  }
}
