// ignore_for_file: library_private_types_in_public_api

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vidflix/pages/video_page/video_page.dart';

class PopularMoviesList extends StatefulWidget {
  final ChewieController? chewieController;

  const PopularMoviesList({Key? key, this.chewieController}) : super(key: key);
  @override
  _PopularMoviesListState createState() => _PopularMoviesListState();
}

class _PopularMoviesListState extends State<PopularMoviesList> {
  final moviesList = [
    {
      'image': 'assets/popular_movies/popular_movies_1.jpg',
    },
    {
      'image': 'assets/popular_movies/popular_movies_2.jpg',
    },
    {
      'image': 'assets/popular_movies/popular_movies_3.jpg',
    },
    {
      'image': 'assets/popular_movies/popular_movies_4.jpg',
    },
    {
      'image': 'assets/popular_movies/popular_movies_5.jpg',
    },
    {
      'image': 'assets/popular_movies/popular_movies_6.jpg',
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 130.0,
      child: ListView.builder(
        itemCount: moviesList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = moviesList[index];
          return InkWell(
            onTap: () {
              if (widget.chewieController != null) {
                widget.chewieController!.pause();
              }
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: const VideoPage()));
            },
            child: Container(
              width: 100.0,
              margin: const EdgeInsets.only(
                left: 10.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
