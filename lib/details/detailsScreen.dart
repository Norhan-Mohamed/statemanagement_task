import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/ColorPalette.dart';

import '../counter/counter.dart';

class DetailsScreen extends StatelessWidget {
  var value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorPalette.secondryColor,
            appBar: AppBar(
              backgroundColor: ColorPalette.secondryColor,
              leading: CircleAvatar(
                child: Consumer<MyCounter>(builder: (context, model, child) {
                  return Image.network(
                    "${model.imageController.text}",
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
                    size: 35,
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
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_sharp,
                    color: ColorPalette.primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            body: Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorPalette.secondryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Image(
                        image: NetworkImage(
                            "https://hershoppinglists.com/wp-content/uploads/2019/02/unusual-home-decor-7-vases.jpg")),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<MyCounter>(builder: (context, mycounter, child) {
                      return Text("Numbr Of Items ${mycounter.counter}");
                    }),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
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
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0))),
                        context: context,
                        barrierColor: Colors.transparent,
                        backgroundColor: ColorPalette.thirdColor,
                        builder: (context) => Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                  height: 200,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Radio(
                                                  value: 1,
                                                  groupValue: value,
                                                  onChanged: (newValue) {}),
                                              Text("vesa"),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                  value: 2,
                                                  groupValue: value,
                                                  onChanged: (newValue) {}),
                                              Text("Paybal"),
                                            ],
                                          ),
                                          Container(
                                            width: 200,
                                            height: 55,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                // setState(() {});
                                              },
                                              child: Text(
                                                'Pay ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(
                                                ColorPalette.fourthColor,
                                              )),
                                            ),
                                          ),
                                        ],
                                      ))),
                            ));
                  },
                  child: Center(
                    heightFactor: 2.9,
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 25),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
