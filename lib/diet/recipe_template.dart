import 'package:flutter/material.dart';
import 'recipes.dart';
import '../app_bar.dart';

final List<int> C = [39, 63, 29, 67, 73];
final List<int> F = [41, 24, 17, 10, 22];
final List<int> P = [23, 17, 27, 68, 35];

final List<List<String>> ingredients = [
  [
    "2 Slices of Toast",
    "2 Medium Size Eggs",
    "1 Avocado",
    "Salt, Pepper (optional)",
  ],
  [
    "5 Tablespoons of Chia Seeds",
    "1 Cup of Whole Milk",
    "1 Tablespoon of Honey",
    "Mixed berries",
    "Vanilla extract",
  ],
  [
    "115 g of Grilled Salmon",
    "1 Bell-Pepper",
    "100 g of Sweet Potatoes (Pre-Cooked)",
    "2 Carrots",
    "1 Red Onion",
    "1 Zucchini",
  ],
  [
    "5 Tablespoons of Brown Rice (Pre-Cooked)",
    "7 Broccoli Florets",
    "200 g Chicken Breast (Pre-Cooked)",
    "2 Tablespoons of Soy Sauce",
    "0.5 Lemon",
    "Herbs and Spices",
    "1 Teaspoon of Butter",
  ],
  [
    "5 Tablespoons of Quinoa  (Pre-Cooked)",
    "150 g Tofu",
    "1 Tablespoon of Oil",
    "2 Tablespoons of Soy Sauce",
    "1 Tablespoon of Honey",
    "2 Carrots",
    "5 Broccoli Florets",
  ],
];

final List<String> instructions = [
  "Mash avocado on toast, sprinkle with salt, pepper, and red pepper flakes. Top with a poached egg.",
  "Mix chia seeds, almond milk, honey, and vanilla. Refrigerate overnight. Serve with fresh fruit.",
  "Bake the vegetables at 400* F first for 30 minutes, then add the salmon and continue baking for 10 minutes.",
  "Cook the rice (30 min) and broccoli (10 min) in salted water. Bake the chicken for 20-25 min at 400* F with lemon juice, herbs and spices. Put everything on the plate, and add a teaspoon of butter and 2 tablespoons of soy sauce.",
  "Cook the quinoa (20 min + 10 min rest) and broccoli (10 min) in salted water. Sauté the vegetables on a hot pan, add tofu and wait till it turns slightly brown. Lastly add the honey and soy sauce.",
];

final List<int> time = [20, 5, 50, 50, 40];

class Recipe extends StatelessWidget {
  const Recipe(this.index, {super.key});

  final int index;

  Container buildBox(BuildContext context, String txt, double w) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 0.035 * size.height,
      width: w * size.width,
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
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.7),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            fontSize: size.width / 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Row createIngredients(BuildContext context, int idx) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Text(
          "\u2022",
          style: TextStyle(
            fontSize: 40,
            height: 0.6,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(width: 0.02 * size.width),
        Flexible(
          child: Text(
            ingredients[index][idx],
            style: TextStyle(
              fontSize: 0.018 * size.height,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> ingredientWidgets = [];
    for (int i = 0; i < ingredients[index].length; ++i) {
      ingredientWidgets.add(createIngredients(context, i));
    }

    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: 0.4 * size.width,
                    child: Image.asset(
                      width: 0.6 * size.width,
                      'assets/diet/recipes/$index.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: size.width / 20),
                Expanded(
                  child: Text(
                    pages[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width / 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildBox(context, "C - ${C[index]} g", 0.18),
                buildBox(context, "F - ${F[index]} g", 0.18),
                buildBox(context, "P - ${P[index]} g", 0.18),
                buildBox(context, "${calories[index]} kcal", 0.2),
              ],
            ),
            SizedBox(height: size.height / 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: size.width / 20,
                  fontWeight: FontWeight.bold,
                  height: 2.5,
                ),
              ),
            ),
            Column(
              children: ingredientWidgets,
            ),
            SizedBox(height: size.height / 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Instructions",
                style: TextStyle(
                  fontSize: size.width / 20,
                  fontWeight: FontWeight.bold,
                  height: 2.5,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                instructions[index],
                style: TextStyle(
                  fontSize: size.width / 25,
                  height: 1.2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: 'Time: ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: size.width / 25,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "${time[index]} min",
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
