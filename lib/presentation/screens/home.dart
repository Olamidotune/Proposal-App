// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:that_app/presentation/widgets/hero.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  bool _showProgressIndicator = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/her.MP4')
      ..initialize().then((_) {
        setState(() {
         
        }); // Trigger a rebuild to show the video
      });

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showProgressIndicator = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade100,
        title: Text(
          "TO MY WOMAN..💕",
        ),
      ),
      body: Stack(
        children: [
          if (_showProgressIndicator)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text(
                    "Initiating love...",
                  ),
                ],
              ),
            ),
          AnimatedOpacity(
            curve: Curves.easeInCirc,
            duration: Duration(milliseconds: 500),
            opacity: _showProgressIndicator ? 0.0 : 1.0,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeroPicture(
                    fileName: 'assets/images/her.jpeg',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "\nMy Dearest Oyebuokola,\n",
                      textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17),
                    ),
                  ),
                  HeroPicture(fileName: "assets/images/her1.JPG"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "\nAs I sit down to write these words, my heart is full with love for you. You've provided me joy, laughing, and boundless delight since we first met. My love for you grows stronger and deeper with each passing day.\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
            HeroPicture(fileName: "assets/images/her2.jpeg"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "\nRemember when we first met on April 25th, 2024, as I saw you enter the door of the restaurant from where I sat, the anxiety I had before arriving to the place turned into pure bliss, you walked closer and I got up to hug you, that was the time I thought to myself \n'Dotun, na she be this' 😹😹😹\n",
                      textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17),
                    ),
                  ),
                   HeroPicture(fileName: "assets/images/her3.jpeg"),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "\nOyebukola, you are the missing piece to my puzzle, the yin to my yang. With you by my side, I feel complete. Your unwavering support, your boundless kindness, and your genuine compassion have made me a better person. I cherish every moment we spend together, whether it's exploring new places, having deep conversations, or simply enjoying each other's company.\n",
                      textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      '\nYou have captured my heart, and I would be the luckiest person in the world if you chose to keep it. My love for you knows no bounds, and I will spend every day showing you how much you mean to me.\n I ask humbly ... "Please may you be my girlfriend? (Offically)🥰"',
                      textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
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

class HeroPicture extends StatelessWidget {
  final String fileName;
  const HeroPicture({
    super.key,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ZoomableImage(imagePath: fileName),
        ));
      },
      child: Hero(
        tag: fileName,
        child: Image.asset(
          fileName,
        ),
      ),
    );
  }
}
