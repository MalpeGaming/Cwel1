import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('Book Description'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height / 32),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height / 32),
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
                        child: Text(audienceReview),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(genre),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(time),
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
