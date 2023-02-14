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

  newName(String value) {
    nameController = value as TextEditingController;
    notifyListeners();
  }

  newEmail(String value) {
    emailController = value as TextEditingController;
    notifyListeners();
  }

  newImage(String value) {
    imageController = value as TextEditingController;
    notifyListeners();
  }

  newPassword(String value) {
    passwordController = value as TextEditingController;
    notifyListeners();
  }

  newNumber(String value) {
    numberController = value as TextEditingController;
    notifyListeners();
  }
}
