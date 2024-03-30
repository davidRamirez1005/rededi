import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';
import 'package:vidflix/pages/video_page/video_page.dart';

class MoreArtist extends StatefulWidget {
  const MoreArtist({Key? key}) : super(key: key);

  @override
  _MoreArtistState createState() => _MoreArtistState();
}

class _MoreArtistState extends State<MoreArtist> {
  Future<List<dynamic>> fetchCats() async {
    final response = await http.get(Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10'));
    return json.decode(response.body);
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
          AppLocalizations.of(context)!
              .translate('moreListPage', 'multiplexMoviesString'),
          style: headingStyle,
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCats(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 10 / 12,
              children: snapshot.data!.map<Widget>((item) => gridItem(item['url'])).toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  gridItem(String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: const VideoPage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}