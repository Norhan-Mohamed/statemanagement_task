import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/registerScreen/registerScreen.dart';

import 'counter/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyCounter>(
      create: (context) => MyCounter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
