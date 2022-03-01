import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LaunchVideoScreen extends StatefulWidget {
  const LaunchVideoScreen({Key? key, required this.videoId}) : super(key: key);

  final String videoId;
  @override
  State<LaunchVideoScreen> createState() => _LaunchVideoScreenState();
}

class _LaunchVideoScreenState extends State<LaunchVideoScreen> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          width: double.infinity,
          progressIndicatorColor: Colors.white,
        ),
        builder: (context, player) {
          return Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              player,
            ],
          );
        },
      ),
    );
  }
}
