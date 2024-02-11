import 'package:flutter/material.dart';
import '/app_bar.dart';

class FoodTable extends StatelessWidget {
  const FoodTable({super.key});

  Column createColumn(BuildContext context, List<Map<String, int>> list) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < list.length; ++i)
          Text(
            list[i].keys.first,
            style: TextStyle(fontSize: size.width / list[i].values.first),
          ),
      ],
    );
  }

  Container createContainer(BuildContext context, double h, Color? color1,
      Color? color2, String text, List<List<Map<String, int>>> list,
      [double w = 0.8,]) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(
        size.width / 75,
      ),
      height: size.height / h,
      width: w * size.width,
      color: color1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: size.width / 28, fontWeight: FontWeight.bold,),
          ),
          Expanded(
            child: Container(
              color: color2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < list.length; ++i)
                    createColumn(context, list[i]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
            createContainer(
              context,
              3.5,
              Colors.purple[300],
              Colors.purple[200],
              "Eat As Much As You Can",
              [
                [
                  {"Spinach": 20},
                  {"Berries": 20},
                  {"CURCUMIN": 18},
                  {"Herbs": 18},
                ],
                [
                  {"Green Vegetables": 20},
                  {"Citrus Fruit": 20},
                  {"Plain Yogurt": 20},
                  {"Avocado": 20},
                ]
              ],
            ),
            createContainer(
              context,
              5,
              Colors.indigo[300],
              Colors.indigo[200],
              "Eat Often",
              [
                [
                  {"Nuts": 20},
                  {"Fish": 20},
                  {"Lentils": 20},
                ],
                [
                  {"Dairy": 20},
                  {"Tofu": 20},
                  {"Potatoes": 20},
                ],
                [
                  {"Beef Liver": 20},
                  {"Cocoa": 20},
                  {"Seafood": 20},
                ]
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                createContainer(
                  context,
                  3.5,
                  Colors.green[300],
                  Colors.green[200],
                  "Avoid Eating",
                  [
                    [
                      {"Candy": 20},
                      {"Cakes": 20},
                      {"Fastfood": 20},
                      {"Butter": 20},
                      {"Pork": 20},
                    ],
                    [
                      {"Cookies": 20},
                      {"Ghee": 20},
                      {"Bacon": 20},
                      {"Sausages": 20},
                      {"Cheese": 20},
                    ],
                  ],
                  0.55,
                ),
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
                            fontWeight: FontWeight.bold,),
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
                                style: TextStyle(fontSize: size.height / 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
