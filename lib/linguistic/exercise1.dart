import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../show_score.dart';
import 'exercise2.dart';
import '../buttons.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FirstLinguisticExercise extends StatefulWidget {
  const FirstLinguisticExercise({super.key});

  @override
  State<FirstLinguisticExercise> createState() => _FirstLinguisticExercise();
}

class _FirstLinguisticExercise extends State<FirstLinguisticExercise> {
  Future<void> _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }

  late SharedPreferences prefs;

  double score = 0;
  String languageLevel = "";

  Future<void> initMemory() async {
    prefs = await SharedPreferences.getInstance();

    setState(
      () {
        languageLevel = prefs.getString('level') ?? "pet";
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initMemory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: "LINGUISTIC\n",
                            style: TextStyle(
                              fontSize: size.width / 8,
                            ),
                          ),
                          TextSpan(
                            text: "INTELLIGENCE",
                            style: TextStyle(
                              fontSize: size.width / 16,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Text(
                    "Exercise 1 - Listening Comprehension",
                    style: TextStyle(fontSize: size.width / 22),
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Do the following listening exercise.",
                    style: TextStyle(fontSize: size.width / 24),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: "hBC7i-vHWsU",
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                        showLiveFullscreenButton: true,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                  SizedBox(
                    height: size.height / 25,
                  ),
                  Text(
                    "Write your PERCENTAGE score BELOW.",
                    style: TextStyle(fontSize: size.width / 24),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: size.width / 24),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            String text = newValue.text;
                            if (text.isEmpty) {
                              score = 0;
                              return newValue;
                            }
                            if (int.parse(text) <= 100) {
                              score = double.parse(text);
                              text += "%";
                              return TextEditingValue(
                                text: text,
                                selection: newValue.selection,
                              );
                            }
                            return oldValue;
                          }),
                        ],
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "5%",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    route: ShowScore(
                      title: "LINGUISTIC",
                      description: "Exercise 1 - Listening Comprehension",
                      exercise: 1,
                      yourScore: score,
                      maximum: 100,
                      page: const SecondLinguisticExercise(),
                      subtitle: "INTELLIGENCE",
                    ),
                    text: 'Continue',
                    width: size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
