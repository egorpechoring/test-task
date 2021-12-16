import 'package:flutter/material.dart';

import 'background_drawer.dart';

class DefaultScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const DefaultScaffold(this.title, this.body, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomPaint(
        child: Container(),
        foregroundPainter: BackgroundPainter(),
      ),
      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width /48),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(title, style: Theme.of(context).textTheme.headline1),
            ),
          ),
          Expanded(
            child: body,
          )
        ],
      )
    ]));
  }
}
