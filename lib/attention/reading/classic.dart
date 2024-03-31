import 'package:flutter/material.dart';
import '../../app_bar.dart';
import '../../your_activities.dart';
import 'book_description.dart';

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
      const BookDescriptionPage(
        title: "Harry Potter and the Philosopher’s Stone",
        author: "J.K. Rowling",
        imageName: "covers/harry",
        audienceReview: "4.5",
        genre: "Fantasy",
        time: "7h 5m",
        description:
            "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed",
      ),
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.onPrimary,
      zero: 0.8,
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
                    "classic/1984",
                    "1984",
                    "by George Orwell",
                  ),
                  createActivity2(
                    context,
                    "classic/the_lord_of_the_rings",
                    "The Lord of the Rings",
                    "by J.R.R. Tolkien",
                  ),
                  createActivity2(
                    context,
                    "classic/the_kite_runner",
                    "The Kite Runner",
                    "by Khaled Hosseini",
                  ),
                  createActivity2(
                    context,
                    "classic/harry_potter",
                    "Harry Potter",
                    "by J.K. Rowling",
                  ),
                  createActivity2(
                    context,
                    "classic/slaughterhouse",
                    "Slaughterhouse-Five",
                    "by Kurt Vonnegut",
                  ),
                  createActivity2(
                    context,
                    "classic/the_lion_the_witch_and_the_wardrobe",
                    "The Lion, the Witch, and the Wardrobe",
                    "by C.S. Lewis",
                    fontSize: 0.85,
                  ),
                  createActivity2(
                    context,
                    "classic/to_kill_a_mockingbird",
                    "To Kill a Mockingbird",
                    "by Harper Lee",
                  ),
                  createActivity2(
                    context,
                    "classic/wuthering_heights",
                    "Wuthering Heights",
                    "by Emily Bronte",
                  ),
                  createActivity2(
                    context,
                    "classic/pride_and_prejudice",
                    "Pride and Prejudice",
                    "by Jane Austen",
                  ),
                  createActivity2(
                    context,
                    "classic/jane_eyre",
                    "Jane Eyre",
                    "by Charlotte Bronte",
                  ),
                  createActivity2(
                    context,
                    "classic/animal_farm",
                    "Animal Farm",
                    "by George Orwell",
                  ),
                  createActivity2(
                    context,
                    "classic/little_women",
                    "Little Women",
                    "by Louisa May Alcott",
                  ),
                  createActivity2(
                    context,
                    "classic/frankenstein",
                    "Frankenstein",
                    "by Mary Shelley",
                  ),
                  createActivity2(
                    context,
                    "classic/dune",
                    "Dune",
                    "by Frank Herbert",
                  ),
                  createActivity2(
                    context,
                    "classic/the_time_machine",
                    "The Time Machine",
                    "by H. G. Wells",
                  ),
                  createActivity2(
                    context,
                    "classic/the_martian_chronicles",
                    "The Martian Chronicles",
                    "by Ray Bradbury",
                  ),
                  createActivity2(
                    context,
                    "classic/discworld",
                    "Discworld",
                    "by Terry Pratchett",
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
