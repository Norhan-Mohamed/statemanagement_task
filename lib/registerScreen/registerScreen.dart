import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/ColorPalette.dart';
import 'package:statemanagement/counter/counter.dart';

import '../welcome/welcomeScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var myFocus;
  void initState() {
    super.initState();
    myFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Consumer<MyCounter>(
        builder: (context, model, child) => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                ColorPalette.primaryColor,
                ColorPalette.secondryColor
              ])),
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "SIGN UP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: ColorPalette.primaryColor,
                      controller: model.nameController,
                      decoration: InputDecoration(
                        hintText: ' Full Name ',
                        contentPadding: const EdgeInsets.only(left: 10),
                        prefixIcon: Icon(
                          Icons.person,
                          color: ColorPalette.thirdColor,
                        ),
                        suffixIcon: null,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      autofocus: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      // autofocus: myFocus,
                      controller: model.emailController,
                      decoration: InputDecoration(
                        hintText: ' Email ',
                        contentPadding: const EdgeInsets.only(left: 10),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: ColorPalette.thirdColor,
                        ),
                        suffixIcon: null,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autofocus: true,
                      controller: model.imageController,
                      decoration: InputDecoration(
                        hintText: 'Profile Picture Link ',
                        contentPadding: const EdgeInsets.only(left: 10),
                        prefixIcon: Icon(
                          Icons.photo,
                          color: ColorPalette.thirdColor,
                        ),
                        suffixIcon: null,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: model.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: const EdgeInsets.only(left: 10),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: ColorPalette.thirdColor,
                        ),
                        suffixIcon: null,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: model.numberController,
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        contentPadding: const EdgeInsets.only(left: 10),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: ColorPalette.thirdColor,
                        ),
                        suffixIcon: null,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Number required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                  ColorPalette.fourthColor,
                )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                child: Center(
                  heightFactor: 2.9,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
