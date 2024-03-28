import 'package:flutter/material.dart';
import 'package:brain_train_app/app_bar.dart';

class BookDescriptionPage extends StatelessWidget {
  final String title;
  final String author;
  final String imageName;
  final String audienceReview;
  final String genre;
  final String time;
  final String description;

  const BookDescriptionPage({
    super.key,
    required this.title,
    required this.author,
    required this.imageName,
    required this.audienceReview,
    required this.genre,
    required this.time,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context, ""),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height / 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height / 64),
            Text(
              author.toUpperCase(), // Convert author name to uppercase
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(height: size.height / 32),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/attention/reading/$imageName.png',
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Reviews",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "$audienceReview/5",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Genre",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              genre,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Time",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              time,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Text(
                description,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
