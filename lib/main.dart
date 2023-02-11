import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/DataBase/model.dart';
import 'package:statemanagement/registerScreen/registerScreen.dart';

import 'DataBase/dataProvider.dart';
import 'counter/counter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyCounter>(
          create: (context) => MyCounter(),
        ),
        ChangeNotifierProvider<MyModel>(
          create: (context) => MyModel(
              name: '', imageUrl: '', email: '', number: '', password: ''),
        ),
      ],
      child: Consumer2<MyModel, MyCounter>(
          builder: (context, model, counter, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      }),
    );
  }
}
