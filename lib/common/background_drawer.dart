import 'package:flutter/material.dart';
import 'dart:math';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double radians = _toRadians(45.0);
    double d = size.width * 1/3;
    double a = d*0.65;
    double b = size.width*1.5;

    final Rect rect0 = Offset.zero & Size(size.width, size.height);
    const LinearGradient gradient0 = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 0, 37, 57),
        Color.fromARGB(255, 0, 26, 39),],
    );
    canvas.drawRect(
      rect0,
      Paint()..shader = gradient0.createShader(rect0),
    );

    //top part drawing
    canvas.rotate(radians);
    Offset p1 = _recalculateOffset(Offset(d,d+1/2*a),radians);

    final Rect rect1 = Rect.fromPoints(p1,Offset(p1.dx+a, p1.dy-b));
    canvas.drawRect(rect1,Paint()..color = const Color.fromARGB(255, 0, 39, 60),);
    final Rect rect2 = Rect.fromPoints(p1,Offset(p1.dx+b, p1.dy-a));
    canvas.drawRect(rect2,Paint()..color = const Color.fromARGB(255, 0, 39, 60),);


    Offset p2 = Offset(p1.dx,p1.dy+2*a);
    final Rect rect3 = Rect.fromPoints(p2,Offset(p2.dx+1.5*b, p2.dy-a));
    canvas.drawRect(rect3,Paint()..color = const Color.fromARGB(255, 0, 35, 53),);

    Offset p3 = Offset(p1.dx,p1.dy+4*a);
    final Rect rect4 = Rect.fromPoints(p3,Offset(p3.dx+1.5*b, p3.dy-a));
    canvas.drawRect(rect4,Paint()..color = const Color.fromARGB(255, 0, 31, 46),);


    //form making
    canvas.rotate(-radians);
    final Rect rect = Offset.zero & Size(size.width * 1/3, size.height);
    const LinearGradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 0, 37, 57),
        Color.fromARGB(255, 0, 26, 39),],
    );
    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );


  }
  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  Offset _recalculateOffset(Offset inputOffset, double degrees){
    double w = inputOffset.dx * cos(degrees) + inputOffset.dy * sin(degrees);
    double h = inputOffset.dx * (-sin(degrees)) + inputOffset.dy * cos(degrees);
    return Offset(w, h);
  }

  double _toRadians(double degrees) => degrees * (pi /180);
}