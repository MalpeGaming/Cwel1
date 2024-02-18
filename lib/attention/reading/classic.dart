import 'package:flutter/material.dart';
import '../../app_bar.dart';
import '../../your_activities.dart';

class Classic extends StatefulWidget {
  const Classic({super.key});

  @override
  State<Classic> createState() => _Classic();
}

class _Classic extends State<Classic> {
  Widget createActivity2(
    BuildContext context,
    String img,
    String txt1,
    String txt2, {
    double fontSize = 1,
  }) {
    Size size = MediaQuery.of(context).size;
    return createActivity(
      context,
      "attention/reading/$img",
      txt1,
      txt2,
      0.025 * size.height * fontSize,
      const Classic(),
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.onPrimary,
      zero: 0.8,
      blocked: true,
      textWidth: 0.4,
      title: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 10,
          right: size.width / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "CLASSIC",
                  style: TextStyle(
                    fontSize: size.width / 8,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "NOVELS",
                  style: TextStyle(
                    fontSize: size.width / 18,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 0.03 * size.height),
            Expanded(
              child: ListView(
                children: [
                  createActivity2(
                    context,
                    "classic",
                    "1984",
                    "by George Orwell",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "The Lord of the Rings",
                    "by J.R.R. Tolkien",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "The Kite Runner",
                    "by Khaled Hosseini",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "Harry Potter",
                    "by J.K. Rowling",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "Slaughterhouse-Five",
                    "by Kurt Vonnegut",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "The Lion, the Witch, and the Wardrobe",
                    "by C.S. Lewis",
                    fontSize: 0.85,
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "To Kill a Mockingbird",
                    "by Harper Lee",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "Wuthering Heights",
                    "by Emily Bronte",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "Pride and Prejudice",
                    "by Jane Austen",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "Jane Eyre",
                    "by Charlotte Bronte",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "Animal Farm",
                    "by George Orwell",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "Little Women",
                    "by Louisa May Alcott",
                  ),
                  createActivity2(
                    context,
                    "classic",
                    "Frankenstein",
                    "by Mary Shelley",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
