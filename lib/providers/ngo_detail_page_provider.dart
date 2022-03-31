import 'package:flutter/material.dart';

class NgoDetailProvider extends ChangeNotifier{

  int _activeIndex = 0;

  set activeIndex(int value) {
    _activeIndex = value;
    notifyListeners();
  }

  int get activeIndex => _activeIndex;

}