import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'listening_comprehension_test.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import 'dart:math';
import '../buttons.dart';
import '../app_bar.dart';

class ListeningComprehensionVideo extends StatefulWidget {
  const ListeningComprehensionVideo({
    super.key,
    this.initialTest = false,
    this.endingTest = false,
  });

  final bool initialTest;
  final bool endingTest;

  @override
  State<ListeningComprehensionVideo> createState() => _Video();
}

class _Video extends State<ListeningComprehensionVideo> {
  double score = 0;
  final _controller = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      mute: false,
      showFullscreenButton: true,
      loop: false,
      enableKeyboard: false,
    ),
  );
  late String videoId = "";
  late int exerciseId = 0;

  @override
  void initState() {
    super.initState();
    chooseVideo();
  }

  void chooseVideo() async {
    final file = await rootBundle
        .loadString('assets/attention/long_term_concentration_test.yaml');
    final newExerciseId = Random().nextInt(13);
    final newVideoId = loadYaml(file)["tests"][newExerciseId]["video_id"];
    _controller.loadVideo("https://www.youtube.com/watch?v=$newVideoId");

    setState(() {
      videoId = newVideoId;
      exerciseId = newExerciseId;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return videoId.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: appBar(context, ""),
            body: SingleChildScrollView(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.9,
                margin: EdgeInsets.only(
                  left: size.width / 10,
                  right: size.width / 10,
                  //top: size.height / 10,
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
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
                          height: size.height / 20,
                        ),
                        Text(
                          "Do the following listening exercise.",
                          style: TextStyle(fontSize: size.width / 24),
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        YoutubePlayer(
                          controller: _controller,
                        ),
                        SizedBox(
                          height: size.height / 50,
                        ),
                        Text(
                          "While listening we recommend you make notes.",
                          style: TextStyle(fontSize: size.width / 26),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.75,
                        child: RedirectButton(
                          route: (widget.initialTest)
                              ? ListeningComprehensionTest(
                                  initialTest: true,
                                  exerciseId: exerciseId,
                                )
                              : ListeningComprehensionTest(
                                  exerciseId: exerciseId,
                                ),
                          text: 'Continue',
                          width: size.width,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 15),
                  ],
                ),
              ),
            ),
          );
  }
}
