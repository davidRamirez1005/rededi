// ignore_for_file: library_private_types_in_public_api

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';
import 'package:vidflix/pages/category/more_list.dart';
import 'package:vidflix/pages/home/home_component/popular_movies.dart';
import 'package:vidflix/pages/video_play/more_episodes.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({super.key});

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  ChewieController? _chewieController;
  final videoPlayerController =
      VideoPlayerController.asset('assets/video/video.mp4');

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController!.pause();
    videoPlayerController.pause();
    videoPlayerController.dispose();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Criminal Justice',
          style: headingStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: Chewie(
              controller: _chewieController!,
            ),
          ),
          heightSpace,
          Padding(
            padding: EdgeInsets.only(left: fixPadding),
            child: Text(
              'Criminal Justice',
              style: headingStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: fixPadding, left: fixPadding),
            child: Text(
              'S1 - E1',
              style: descriptionStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
              AppLocalizations.of(context)!
                  .translate('videoPlayPage', 'moreEpisodesString'),
              style: headingStyle,
            ),
          ),
          MoreEpisodesList(chewieController: _chewieController),
          heightSpace,
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!
                      .translate('videoPlayPage', 'youMayAlsoLikeString'),
                  style: headingStyle,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: const MoreList()));
                  },
                  child: Text(
                      AppLocalizations.of(context)!
                          .translate('videoPlayPage', 'moreString'),
                      style: linkStyle),
                ),
              ],
            ),
          ),
          PopularMoviesList(chewieController: _chewieController),
          heightSpace,
        ],
      ),
    );
  }
}
