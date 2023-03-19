import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IOTheme {
  Color IOBlue = Color(0xff032D43);
  Color IOGreen = Color(0xff86ED78);
}

List<String> videos = [
  "https://download.samplelib.com/mp4/sample-5s.mp4",
  "https://download.samplelib.com/mp4/sample-10s.mp4",
  "https://download.samplelib.com/mp4/sample-15s.mp4",
  "https://download.samplelib.com/mp4/sample-20s.mp4",
];

VideoPlayerController videoPlayerController = VideoPlayerController.network('');

ValueNotifier<Future<void>?> notifier = ValueNotifier(null);

Future<void> play(String url) async {
  if (url.isEmpty) return;
  if (videoPlayerController.value.isInitialized) {
    await videoPlayerController.dispose();
  }
  videoPlayerController = VideoPlayerController.network(url);
  return videoPlayerController
      .initialize()
      .then((value) => videoPlayerController.play());
}
