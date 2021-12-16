import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      child: const Text("START"),
      onPressed: () {
        Navigator.pushNamed(context, '/profileScreen');
      },
    ));
  }
}

