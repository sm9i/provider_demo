import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int position = 884;
  bool openSwitch = false;

  changePosition(int position) {
    this.position = position;
    notifyListeners();
  }

  changeSwitch(bool sw) {
    if (openSwitch == sw) return;
    openSwitch = sw;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
