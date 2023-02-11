import 'package:flutter/foundation.dart';

import 'dataProvider.dart';

class MyModel with ChangeNotifier {
  int? id;
  String? name;
  String? email;
  String? imageUrl;
  String? password;
  String? number;
  MyModel(
      {required this.name,
      required this.imageUrl,
      required this.email,
      required this.number,
      required this.password,
      this.id});
  MyModel.fromMap(Map<String, dynamic> map) {
    this.imageUrl = map[imageUrl];
    if (map[columnId] != null) this.id = map[columnId];
    this.name = map[columnname];
    this.number = map[columnnumber];
    this.email = map[columnemail];
    this.password = map[columnpassword];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map[columnimageUrl] = this.imageUrl;
    if (this.id != null) map[columnId] = this.id;
    map[columnname] = this.name;
    map[columnnumber] = this.number;
    map[columnemail] = this.email;
    map[columnpassword] = this.password;
    return map;
  }

  notifyListeners();
}
