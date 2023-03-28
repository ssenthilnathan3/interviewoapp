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

const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

const mainColor = Color(0xff032D43);
const textColor = Color.fromRGBO(20, 20, 20, 1.0);
