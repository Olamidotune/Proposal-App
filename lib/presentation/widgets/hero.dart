import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomableImage extends StatelessWidget {
  final String imagePath;

  const ZoomableImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Center(
          child: Hero(
            tag: imagePath,
            child: PhotoView(
              imageProvider: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
