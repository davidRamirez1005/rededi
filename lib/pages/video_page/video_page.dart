// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';
import 'package:vidflix/pages/video_page/image_section.dart';
import 'package:vidflix/pages/video_page/title_description.dart';
import 'package:vidflix/pages/video_page/episodes.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
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
              .translate('videoPage', 'webSeriesString'),
          style: headingStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const ImageSection(),
          SizedBox(height: 5.0), // Agrega una distancia de 10.0
          const SocialMediaList(),
          SizedBox(height: 1.0), // Agrega una distancia de 10.0
          const TitleDescription(),
          // Padding(
          //   padding: EdgeInsets.all(fixPadding),
          //   child: Row(
          //     children: <Widget>[
          //       InkWell(
          //         onTap: () {},
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
