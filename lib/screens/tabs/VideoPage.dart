import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:interviewo/utils/colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _isplayArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();

    //_onTapVideo(-1);
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: _isplayArea == false
          ? BoxDecoration(
              gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ))
          : BoxDecoration(color: color.AppColor.gradientSecond),
      child: Column(
        children: [
          _isplayArea == false
              ? Container(
                  padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor),
                          ),
                          Expanded(child: Container()),
                          Icon(Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Legs Toning",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.secondPageTitleColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "and Glutes Workout",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.secondPageTitleColor),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "68 min",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          color.AppColor.secondPageIconColor),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 250,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.handyman_outlined,
                                  size: 15,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Resistent band,kettebell",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          color.AppColor.secondPageIconColor),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
              : Container(
                  child: Column(children: [
                  Container(
                      height: 100,
                      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                      child: Row(children: [
                        InkWell(
                          onTap: () {
                            debugPrint("tapped");
                          },
                          child: Icon(Icons.arrow_back_ios_new,
                              size: 20,
                              color: color.AppColor.secondPageTopIconColor),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.info_outlined,
                            size: 20,
                            color: color.AppColor.secondPageTopIconColor)
                      ])),
                  _playView(context),
                  _controlView(context)
                ])),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70))),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Circuit 1: Legs Toning",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.circuitsColor),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(Icons.loop,
                            size: 30, color: color.AppColor.loopColor),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3 sets",
                          style: TextStyle(
                            fontSize: 15,
                            color: color.AppColor.setsColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(child: _listView())
              ],
            ),
          ))
        ],
      ),
    ));
  }

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      itemCount: videoInfo.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_isplayArea == false) {
                  _isplayArea = true;
                }
              });
            },
            child: _buildCard(index));
      },
    );
  }

  Widget _playView(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
            height: 300, width: 300, child: VideoPlayer(_controller!)));
    // final controller = _controller;
    // if (controller.value.isInitialized) {
    // } else {
    //   return Text("Being initialized!");
    // }
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: color.AppColor.gradientSecond,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(50, 0, 0, 0))
                  ]),
                  child: Icon(noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white),
                )),
            onTap: () {
              if (noMute) {
                _controller?.setVolume(0);
              } else {
                _controller?.setVolume(1.0);
              }
              setState(() {});
            }),
        ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 0),
            onPressed: () async {
              final index = _isPlayingIndex - 1;
              if (index >= 0 && videoInfo.length >= 0) {
                _onTapVideo(index);
              } else {
                Get.snackbar("Video List", "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(Icons.face, size: 30),
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    messageText: Text("No more videos in the list",
                        style: TextStyle(fontSize: 20, color: Colors.white)));
              }
            },
            child: Icon(Icons.fast_rewind, size: 36, color: Colors.white)),
        ElevatedButton(
            onPressed: () async {
              if (_isPlaying) {
                setState(() {
                  _isPlaying = false;
                });
                _controller?.pause();
              } else {
                setState(() {
                  _isPlaying = true;
                });
                _controller?.play();
              }
            },
            style: ElevatedButton.styleFrom(elevation: 0),
            child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                size: 36, color: Colors.white)),
        ElevatedButton(
            onPressed: () async {
              final index = _isPlayingIndex + 1;
              if (index <= videoInfo.length - 1) {
                _onTapVideo(index);
              } else {
                Get.snackbar("Video List", "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(Icons.face, size: 30),
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    messageText: Text("You have finished all the videos",
                        style: TextStyle(fontSize: 20, color: Colors.white)));
              }
            },
            style: ElevatedButton.styleFrom(elevation: 0),
            child: Icon(Icons.fast_forward, size: 36, color: Colors.white))
      ]),
    );
  }

  var _onUpdateControllerTime;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }

    if (!controller.value.isInitialized) {
      debugPrint("controller cannot be initialized");
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  _onTapVideo(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        _controller?.addListener(_onControllerUpdate);
        _controller?.play();
      });
    setState(() {});
  }

  _buildCard(int index) {
    return Container(
        height: 135,
        child: Column(
          children: [
            Row(children: [
              Container(
                  width: 80,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(videoInfo[index]["thumbnail"]),
                          fit: BoxFit.cover))),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(videoInfo[index]["title"],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(videoInfo[index]["time"],
                          style: TextStyle(color: Colors.grey[500])))
                ],
              )
            ]),
          ],
        ));
  }
}
