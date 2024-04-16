import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _Recipes();
}

class _Recipes extends State<Recipes> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  List<String> pages = [
    "Avocado Toast with Poached Egg",
    "Chia Seed Pudding",
    "Grilled Salmon with Vegetables",
    "Baked Lemon Herb Chicken",
    "Vegetarian Stir-Fry",
  ];

  Container createRecipe(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 0.5 * size.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.onPrimary,
          ],
          tileMode: TileMode.decal,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 0.13 * size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  pages[index].toString(),
                  style: TextStyle(
                    fontSize: size.width / 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.fromSize(
              child: Image.asset(
                width: 0.6 * size.width,
                'assets/diet/recipes/$index.png',
                fit: BoxFit.cover,
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
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 20,
          right: size.width / 20,
          top: size.height / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "5 BRAIN RECIPES",
                    style: TextStyle(
                      fontSize: size.width / 11,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    "THAT ARE RATHER EASY TO MAKE",
                    style: TextStyle(fontSize: size.width / 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.05 * size.height),
                SizedBox(
                  height: 0.5 * size.height,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return createRecipe(context, index % 5);
                    },
                  ),
                ),
                SizedBox(height: 0.07 * size.height),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 5,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      type: WormType.thinUnderground,
                    ),
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
