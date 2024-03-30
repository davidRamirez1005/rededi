import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:vidflix/pages/video_page/video_page.dart';

class MultiPlexMoviesList extends StatefulWidget {
  const MultiPlexMoviesList({Key? key}) : super(key: key);

  @override
  _MultiPlexMoviesListState createState() => _MultiPlexMoviesListState();
}

class _MultiPlexMoviesListState extends State<MultiPlexMoviesList> {
  Future<List<dynamic>> fetchCats() async {
    final response = await http.get(Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 130.0,
      child: FutureBuilder<List<dynamic>>(
        future: fetchCats(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return InkWell(
                  onTap: () {
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
                        image: NetworkImage(item['url']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}