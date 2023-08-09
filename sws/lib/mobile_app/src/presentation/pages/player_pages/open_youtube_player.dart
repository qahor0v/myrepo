import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class OpenYouTubePlayerPage extends StatefulWidget {
  final String id;

  const OpenYouTubePlayerPage({
    super.key,
    required this.id,
  });

  @override
  State<OpenYouTubePlayerPage> createState() => _OpenYouTubePlayerPageState();
}

class _OpenYouTubePlayerPageState extends State<OpenYouTubePlayerPage> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    youtubePlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: YoutubePlayerBuilder(
          builder: (BuildContext context, Widget player) {
            return Center(
              child: player,
            );
          },
          player: YoutubePlayer(
            controller: youtubePlayerController,
          ),
        ),
      ),
    );
  }
}
