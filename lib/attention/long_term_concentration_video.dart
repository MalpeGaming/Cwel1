import 'package:brain_train_app/buttons.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'long_term_concentration_test.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import 'dart:math';

class LongTermConcentrationVideo extends StatefulWidget {
  const LongTermConcentrationVideo({super.key, this.initialTest = false});

  final bool initialTest;

  @override
  State<LongTermConcentrationVideo> createState() =>
      _LongTermConcentrationVideo();
}

class _LongTermConcentrationVideo extends State<LongTermConcentrationVideo> {
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
                          child: Text(
                            "ATTENTION",
                            style: TextStyle(
                              fontSize: size.width / 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          "Exercise 2 - Long Term Concentration",
                          style: TextStyle(
                            fontSize: size.width / 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height / 25,
                        ),
                        Text(
                          "Do the following listening exercise.",
                          style: TextStyle(fontSize: size.width / 26),
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
                    RedirectButton(
                      route: (widget.initialTest)
                          ? LongTermConcentrationTest(
                              initialTest: true,
                              exerciseId: exerciseId,
                            )
                          : LongTermConcentrationTest(
                              exerciseId: exerciseId,
                            ),
                      text: 'Continue',
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
