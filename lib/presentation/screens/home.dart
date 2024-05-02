// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  late ScrollController _scrollController;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/her.MP4')
      ..initialize().then((_) {
        setState(() {});
      });

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _opacity = 1.0;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text(
          "Hey Baby, Will You Be My Girlfriend? 💕",
          style: textTheme.bodyText1,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                "assets/images/IMG_7115.jpeg",
              ),
              SizedBox(
                height: 5,
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Text(
                  "My Dearest Oyebuokola,\n",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Add null check before accessing _scrollController
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Image.asset(
                  "assets/images/her1.JPG",
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Text(
                  "As I sit down to pen these words, my heart is overflowing with love for you. From the moment we met, you've brought joy, laughter, and endless happiness into my life. With each passing day, my love for you has grown deeper and more profound.\n",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Image.asset(
                  "assets/images/her2.jpeg",
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Text(
                  "Today, I come before you with a heart full of hope and a question that has been on my mind for a long time. [Insert personal anecdote or memory that highlights your relationship]. In you, I've found my soulmate, my confidant, and my best friend.\n",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Image.asset(
                  "assets/images/her3.jpeg",
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Text(
                  "Oyebuokola, will you do me the incredible honor of spending the rest of your life with me? Will you be my partner in all things, through the highs and lows, the laughter and tears? I can't imagine my life without you by my side, and I promise to cherish and adore you for all eternity.\n",
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : CircularProgressIndicator(),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _opacity,
                child: Text(
                  "With all my love,\n"
                  "Olamidotun",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
