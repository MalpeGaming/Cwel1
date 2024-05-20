import 'package:brain_train_app/attention/find_the_number.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'navbar.dart';
import 'self_reflection.dart';
import 'meditation/meditation.dart';
import 'sport.dart';
import 'yoga.dart';
import 'memory/memory_game1.dart';
import 'memory/memory.dart';
import 'memory/faces.dart';
import 'attention/long_term_concentration_video.dart';
import 'attention/short_term_concentration.dart';
import 'attention/strong_concentration.dart';
import 'attention/reading/reading.dart';
import 'logical_thinking/sudoku.dart';
import 'attention/find_the_word.dart';
import 'linguistic/wordly.dart';
import 'linguistic/hangman.dart';
import 'logical_thinking/riddles.dart';
import 'linguistic/exercise2.dart';
import 'linguistic/video.dart';
import 'memory/memory_video.dart';
import 'linguistic/scrabble.dart';
import '2048/game_2048.dart';
import 'linguistic/spelling_mistakes.dart';
import 'well_being/memes.dart';

class YourActivities extends StatefulWidget {
  const YourActivities({super.key});
  @override
  State<YourActivities> createState() => _YourActivities();
}

GestureDetector createActivity(
  BuildContext context,
  String img,
  String text1,
  String text2,
  double fontSize,
  Widget route,
  Color color1,
  Color color2, {
  double zero = 1,
  bool blocked = false,
  double textWidth = 0.45,
  title = false,
}) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      if (!blocked) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      }
    },
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                color1,
                color2,
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
          height: 0.115 * size.height,
          child: Row(
            children: [
              SizedBox(
                height: 0.115 * size.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    child: Image.asset('assets/$img.png', fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 0.045 * size.width),
              SizedBox(
                width: size.width * textWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        fontStyle:
                            (title) ? FontStyle.italic : FontStyle.normal,
                      ),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: zero * fontSize,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.025 * size.height),
      ],
    ),
  );
}

class _YourActivities extends State<YourActivities> {
  Widget createActivity2(
    BuildContext context,
    String img,
    String txt1,
    String txt2,
    Widget route, {
    double fontSize = 1,
    double zero = 1,
  }) {
    Size size = MediaQuery.of(context).size;
    return createActivity(
      context,
      "activities/$img",
      txt1,
      txt2,
      0.022 * size.height * fontSize,
      route,
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.onPrimary,
      zero: zero,
      blocked: false,
      textWidth: 0.45,
      title: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    var formatter = DateFormat('E. dd MMM');
    String formattedDate = formatter.format(now);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: size.width / 15,
          right: size.width / 15,
          top: size.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "YOUR ACTIVITIES",
                style: TextStyle(
                  fontSize: size.width / 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                "DAY 1 - ${formattedDate.toString().toUpperCase()}",
                style: TextStyle(fontSize: size.width / 17),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 0.02 * size.height),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: size.width / 20,
                      right: size.width / 20,
                    ),
                    child: Column(
                      children: [
                        createActivity2(
                          context,
                          "learning_words",
                          "LEARNING",
                          "Words",
                          const Memory(),
                        ),
                        createActivity2(
                          context,
                          "working_memory",
                          "Working",
                          "MEMORY",
                          const MemoryVideo(),
                        ),
                        createActivity2(
                          context,
                          "memory_game",
                          "MEMORY",
                          "Game",
                          const MemoryGame1(),
                        ),
                        createActivity2(
                          context,
                          "learning_course",
                          "LEARNING",
                          "Course",
                          const YourActivities(),
                        ),
                        createActivity2(
                          context,
                          "sport",
                          "SPORT",
                          "Optional",
                          const Sport(),
                        ),
                        createActivity2(
                          context,
                          "self_reflection",
                          "Self",
                          "Reflection",
                          const SelfReflection(),
                        ),
                        createActivity2(
                          context,
                          "good_deed",
                          "GOOD",
                          "Deed",
                          const YourActivities(),
                        ),
                        createActivity2(
                          context,
                          "meditation",
                          "MEDITATION",
                          "",
                          const Meditation(),
                          zero: 0,
                        ),
                        createActivity2(
                          context,
                          "find_the_number",
                          "Find the",
                          "NUMBER",
                          const FindTheNumber(),
                        ),
                        createActivity2(
                          context,
                          "listening",
                          "LISTENING",
                          "Comprehension",
                          const Video(),
                        ),
                        createActivity2(
                          context,
                          "reading",
                          "READING",
                          "Comprehension",
                          const SecondLinguisticExercise(),
                        ),
                        createActivity2(
                          context,
                          "poems",
                          "POEMS",
                          "Reading",
                          const YourActivities(),
                        ),
                        createActivity2(
                          context,
                          "spelling",
                          "SPELLING",
                          "Mistakes",
                          const SpellingMistakes(
                            exerciseId: 0,
                          ),
                        ),
                        createActivity2(
                          context,
                          "math",
                          "MATH",
                          "Exercises",
                          const YourActivities(),
                        ),
                        createActivity2(
                          context,
                          "riddles",
                          "RIDDLES",
                          "",
                          const RiddlesTest(
                            exerciseId: 0,
                          ),
                          zero: 0,
                        ),
                        createActivity2(
                          context,
                          "sudoku",
                          "SUDOKU",
                          "",
                          const SudokuGame(),
                          zero: 0,
                        ),
                        createActivity2(
                          context,
                          "data_analysis",
                          "Data",
                          "ANALYSIS",
                          const YourActivities(),
                        ),
                        createActivity2(
                          context,
                          "short_term_concentration",
                          "Short-Term",
                          "CONCENTRATION",
                          const ShortTermConcentration(),
                        ),
                        createActivity2(
                          context,
                          "long_term_concentration",
                          "Long-Term",
                          "CONCENTRATION",
                          const LongTermConcentrationVideo(),
                        ),
                        createActivity2(
                          context,
                          "strong_concentration",
                          "Strong",
                          "CONCENTRATION",
                          const StrongConcentration(),
                        ),
                        createActivity2(
                          context,
                          "reading_out_loud",
                          "READING",
                          "Out-loud",
                          const Reading(),
                        ),
                        createActivity2(
                          context,
                          "find_the_word",
                          "FIND",
                          "The Word",
                          const FindTheWord(),
                        ),
                        createActivity2(
                          context,
                          "hangman",
                          "HANGMAN",
                          "",
                          const Hangman(),
                          zero: 0,
                        ),
                        createActivity2(
                          context,
                          "wordly",
                          "WORDLY",
                          "",
                          const Wordly(),
                          zero: 0,
                        ),
                        createActivity2(
                          context,
                          "2048",
                          "2048",
                          "",
                          const Game2048(),
                          zero: 0,
                        ),
                        createActivity2(
                          context,
                          "scrabble",
                          "Like",
                          "SCRABBLE",
                          const Scrabble(
                            iteration: 1,
                            allPoints: 0,
                          ),
                        ),
                        createActivity2(
                          context,
                          "seaquance_backwards",
                          "Seaquance",
                          "BACKWARDS",
                          const YourActivities(),
                        ),
                        createActivity2(
                          context,
                          "faces_memory",
                          "Faces",
                          "MEMORY",
                          const Faces(),
                        ),
                        createActivity2(
                          context,
                          "find_the_image",
                          "Find the",
                          "Image",
                          const YourActivities(),
                        ),
                        createActivity2(
                          context,
                          "yoga",
                          "Yoga",
                          "",
                          const Yoga(),
                          zero: 0,
                        ),
                        createActivity2(
                            (context), "xd", "memes", "memes", Meme()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
