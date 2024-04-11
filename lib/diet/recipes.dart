import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _Recipes();
}

class _Recipes extends State<Recipes> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  final pages = List.generate(
    6,
    (index) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade300,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: SizedBox(
        height: 360,
        child: Center(
          child: Text(
            "Page $index",
            style: const TextStyle(color: Colors.indigo),
          ),
        ),
      ),
    ),
  );

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
                SizedBox(height: 0.1 * size.height),
                SizedBox(
                  height: 340,
                  child: PageView.builder(
                    controller: controller,
                    // itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    },
                  ),
                ),
                SizedBox(height: 0.07 * size.height),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
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

