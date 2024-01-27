import 'package:flutter/material.dart';
import '/app_bar.dart';

class FoodTable extends StatelessWidget {
  const FoodTable({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBar(context, "Food Table"),
        body: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 25,
            bottom: size.height / 17.5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(
                    size.width / 75,
                  ),
                  height: size.height / 3.5,
                  color: Colors.purple[300],
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Eat As Much As You Can",
                          style: TextStyle(
                              fontSize: size.width / 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Container(
                                color: Colors.purple[200],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Spinach",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Berries",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "CURCUMIN",
                                          style: TextStyle(
                                              fontSize: size.width / 15),
                                        ),
                                        Text(
                                          "Herbs",
                                          style: TextStyle(
                                              fontSize: size.width / 15),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Green Vegetables",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Citrus Fruit",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Plain Yogurt",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Avocado",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
                      ])),
              Container(
                  padding: EdgeInsets.all(
                    size.width / 75,
                  ),
                  height: size.height / 5,
                  color: Colors.indigo[300],
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Eat Often",
                          style: TextStyle(
                              fontSize: size.width / 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Container(
                                color: Colors.indigo[200],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Nuts",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Fish",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Lentils",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Beef Liver",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Tofu",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Potatoes",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Dairy",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Cocoa",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                        Text(
                                          "Seafood",
                                          style: TextStyle(
                                              fontSize: size.width / 17),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
                      ])),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    padding: EdgeInsets.all(
                      size.width / 75,
                    ),
                    height: size.height / 3.5,
                    width: size.width * 33 / 60,
                    color: Colors.green[300],
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Avoid Eating",
                            style: TextStyle(
                                fontSize: size.width / 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Container(
                                  color: Colors.green[200],
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Candy",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                          Text(
                                            "Cakes",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                          Text(
                                            "Fastfood",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                          Text(
                                            "Butter",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                          Text(
                                            "Pork",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Cookies",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                          Text(
                                            "Ghee",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                          Text(
                                            "Bacon",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                          Text(
                                            "Sausages",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                          Text(
                                            "Cheese",
                                            style: TextStyle(
                                                fontSize: size.width / 17),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))),
                        ])),
                Container(
                    padding: EdgeInsets.all(
                      size.width / 75,
                    ),
                    height: size.height / 3.5,
                    width: size.width * 13 / 60,
                    color: Colors.yellow[400],
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Never",
                            style: TextStyle(
                                fontSize: size.width / 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Container(
                                  height: double.infinity,
                                  color: Colors.yellow[200],
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    child: RotatedBox(
                                        quarterTurns: 1,
                                        child: Text(
                                          "ALCOHOL",
                                          style: TextStyle(
                                              fontSize: size.height / 20),
                                          textAlign: TextAlign.center,
                                        )),
                                  ))),
                        ])),
              ])
            ],
          ),
        ));
  }
}
