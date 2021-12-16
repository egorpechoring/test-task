import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class EventData with ChangeNotifier{
  int _activeIndex =-1;

  int get activeIndex => _activeIndex;

  void modify(int i) {
    _activeIndex = i;
    notifyListeners();
  }
}