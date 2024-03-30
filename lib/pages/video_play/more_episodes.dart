// ignore_for_file: library_private_types_in_public_api

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/pages/video_play/video_play.dart';

class MoreEpisodesList extends StatefulWidget {
  final ChewieController? chewieController;

  const MoreEpisodesList({Key? key, this.chewieController}) : super(key: key);
  @override
  _MoreEpisodesListState createState() => _MoreEpisodesListState();
}

class _MoreEpisodesListState extends State<MoreEpisodesList> {
  final moviesList = [
    {
      'image': 'assets/episode/episode_2.jpg',
      'title': 'S1 - E2',
    },
    {
      'image': 'assets/episode/episode_3.jpg',
      'title': 'S1 - E3',
    },
    {
      'image': 'assets/episode/episode_4.jpg',
      'title': 'S1 - E4',
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 150.0,
      child: ListView.builder(
        itemCount: moviesList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = moviesList[index];
          return InkWell(
            onTap: () {
              widget.chewieController!.pause();
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomCenter,
                      child: const VideoPlay()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 170.0,
                  height: 120.0,
                  margin: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item['image']!),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Text(
                    item['title']!,
                    style: descriptionStyle,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
