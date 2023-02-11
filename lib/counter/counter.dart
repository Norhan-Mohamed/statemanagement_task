import 'package:flutter/foundation.dart';

class MyCounter extends ChangeNotifier {
  int counter = 0;
  increase() {
    counter++;
    notifyListeners();
  }

  decrease() {
    counter--;
    notifyListeners();
    if (counter <= 1) {
      counter = 1;
    }
  }
}
