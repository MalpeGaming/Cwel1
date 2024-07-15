import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import '/app_bar.dart';
import '/buttons.dart';

class VideoListItem extends StatefulWidget {
  final String videoAsset;

  const VideoListItem({super.key, required this.videoAsset});

  @override
  _VideoListItemState createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              WidgetsFlutterBinding.ensureInitialized();

              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.amber,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: Center(
                  child: FlickVideoPlayer(
                    flickManager: flickManager,
                    flickVideoWithControls: const FlickVideoWithControls(
                      controls: FlickPortraitControls(),
                    ),
                    flickVideoWithControlsFullscreen:
                        const FlickVideoWithControls(
                      controls: FlickLandscapeControls(),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              'https://img.youtube.com/vi/${widget.videoAsset.substring(widget.videoAsset.length - 11)}/0.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 48,
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Text(
                          'Check internet connection',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}

class MeditationVideos extends StatefulWidget {
  final int videoTime;
  const MeditationVideos({super.key, required this.videoTime});

  @override
  State<MeditationVideos> createState() => _MeditationVideos();
}

class _MeditationVideos extends State<MeditationVideos> {
  List<String> videoAssets = [
    'https://www.youtube.com/watch?v=pTn6Ewhb27k',
    'https://www.youtube.com/watch?v=pTn6Ewhb27k',
    'https://www.youtube.com/watch?v=t1ZnptSEPI8',
    'https://www.youtube.com/watch?v=pTn6Ewhb27k',
    'https://www.youtube.com/watch?v=pTn6Ewhb27k',
    'https://www.youtube.com/watch?v=pTn6Ewhb27k',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: size.width / 10,
            right: size.width / 10,
            top: size.height / 50,
            bottom: size.height / 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "MEDITATION",
                      style: TextStyle(
                        fontSize: size.width / 8,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'STEP BY STEP',
                      style: TextStyle(fontSize: size.width / 22),
                    ),
                  ),
                  SizedBox(height: 0.04 * size.height),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: size.width / 18,
                          height: 1.2,
                        ),
                        children: const [
                          TextSpan(
                            text: 'To which ',
                          ),
                          TextSpan(
                            text: 'rain animation',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' would you like to meditate?'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 30),
                  SizedBox(
                    height: size.height / 1.825,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            children:
                                List.generate(videoAssets.length, (index) {
                              return VideoListItem(
                                videoAsset: videoAssets[index],
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: size.height / 20),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: size.height * 0.05,
                  width: size.width * 0.75,
                  child: RedirectButton(
                    onClick: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
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
