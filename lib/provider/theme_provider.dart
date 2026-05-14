import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  int  _themeIndex = 0;
  int get themeIndex => _themeIndex;

  void changeToSystem(int index){
    _themeIndex = 0;
    notifyListeners();
  }

  void changeToLight(int index){
    _themeIndex = 1;
    notifyListeners();
  }

  void changeToDark(int index){
    _themeIndex = 2;
    notifyListeners();
  }
}