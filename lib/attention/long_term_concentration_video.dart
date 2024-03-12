import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/material.dart';
import 'long_term_concentration_test.dart';

class LongTermConcentrationVideo extends StatefulWidget {
  const LongTermConcentrationVideo({super.key, this.initialTest = false});

  final bool initialTest;

  @override
  State<LongTermConcentrationVideo> createState() =>
      _LongTermConcentrationVideo();
}

class _LongTermConcentrationVideo extends State<LongTermConcentrationVideo> {
  double score = 0;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
        enableKeyboard: false,
      ),
    );

    _controller.loadVideo("https://www.youtube.com/watch?v=YiiLg_KbZDM");
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
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                    width: size.width * 0.75,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        _controller.close();
                        Navigator.pop(context);

                        if (widget.initialTest) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LongTermConcentrationTest(
                                initialTest: true,
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LongTermConcentrationTest(),
                            ),
                          );
                        }
                      },
                      tooltip: 'Continue',
                      label: Text(
                        "Continue",
                        style: TextStyle(fontSize: size.width / 16),
                      ),
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        size: size.width / 16,
                      ),
                      backgroundColor: Colors.blue[400],
                      hoverColor: Colors.blue[900],
                      autofocus: true,
                      heroTag: "continue",
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
