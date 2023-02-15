import 'package:flutter/cupertino.dart';

class MyCounter extends ChangeNotifier {
  int counter = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  increase() {
    counter++;
    notifyListeners();
  }

  decrease() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }
}
