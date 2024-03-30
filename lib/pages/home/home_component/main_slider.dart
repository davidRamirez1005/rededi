import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainSlider extends StatefulWidget {
  const MainSlider({Key? key});

  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  final List<String> videoIds = [
    'jsCjJjg3QT8',
    'jBwl_68f9RU',
    'H7zf6PaXIdE',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Column(
        children: <Widget>[
          CarouselSlider.builder(
            itemCount: videoIds.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoIds[index],
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
              );
            },
            options: CarouselOptions(
              height: (height / 4.2),
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
