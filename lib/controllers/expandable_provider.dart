import 'package:flutter/material.dart';

class ExpandableProvider extends ChangeNotifier {
  bool isMobile = false;

  changeIsMobile(bool input) {
    isMobile = input;
  }

  //Los vectores indican cuales elementos estan expandidos o no
  List sections = [
    //Seccion 0 es la seccion de experience
    [false, false, false, false, false],
    [0.0, 0.0, 0.0, 0.0, 0.0],
    //Esta seccion seria la 2 en indice, pero se refiere a la de Projects
    [false, false, false, false],
    [0.0, 0.0, 0.0, 0.0],
  ];

  double currentSection1Offset = 0;
  double currentSection2Offset = 0;

  void calculate1() {
  currentSection1Offset = 0.0;

  for (int i = 0; i < sections[0].length; i++) {
    if (sections[0][i]) {
      currentSection1Offset += sections[1][i];
    }
  }

  currentSection2Offset = 0.0;
  for (int i = 0; i < sections[2].length; i++) {
    if (sections[2][i]) {
      currentSection2Offset += sections[3][i];
    }
  }

  notifyListeners();
}
}
