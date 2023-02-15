import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/ColorPalette.dart';
import 'package:statemanagement/counter/counter.dart';
import 'package:statemanagement/details/detailsScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorPalette.secondryColor,
          appBar: AppBar(
            backgroundColor: ColorPalette.secondryColor,
            leading: CircleAvatar(
              child: Consumer<MyCounter>(builder: (context, model, child) {
                return Image(
                  fit: BoxFit.fill,
                  image: NetworkImage("${model.imageController}"),
                );
              }),
            ),
            title: Consumer<MyCounter>(
              builder: (context, model, child) {
                return Text("hi ${model.nameController.text}");
              },
            ),
            actions: [
              Stack(children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                ),
                Consumer<MyCounter>(builder: (context, mycounter, child) {
                  return Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: ColorPalette.primaryColor,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    child: Center(
                      child: Text("${mycounter.counter}"),
                    ),
                  );
                })
              ]),
            ],
          ),
          body: SingleChildScrollView(
            child: Consumer<MyCounter>(
              builder: (context, model, child) => Column(children: [
                Image(
                    image: NetworkImage(
                        "https://hershoppinglists.com/wp-content/uploads/2019/02/unusual-home-decor-7-vases.jpg")),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome ${model.nameController.text}\n your email is ${model.emailController.text}\n your phone number is ${model.numberController.text}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: ColorPalette.fourthColor,
                            width: 2,
                          )),
                      child: Center(
                        child: Consumer<MyCounter>(
                            builder: (context, mycounter, child) {
                          return IconButton(
                            icon: Icon(
                              Icons.minimize,
                              size: 15,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              mycounter.decrease();
                            },
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Consumer<MyCounter>(builder: (context, mycounter, child) {
                      return Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: ColorPalette.fourthColor,
                              width: 2,
                            )),
                        child: Center(
                          child: Text("${mycounter.counter}"),
                        ),
                      );
                    }),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: ColorPalette.fourthColor,
                            width: 2,
                          )),
                      child: Center(
                        child: Consumer<MyCounter>(
                            builder: (context, mycounter, child) {
                          return IconButton(
                            icon: Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              mycounter.increase();
                            },
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                      ColorPalette.fourthColor,
                    )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    },
                    child: Center(
                      heightFactor: 2.9,
                      child: Text(
                        "Add To Cart",
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
          )),
    );
    // });
  }
}
