// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/pages/category/category.dart';

class ExploreByGernre extends StatefulWidget {
  const ExploreByGernre({super.key});

  @override
  _ExploreByGernreState createState() => _ExploreByGernreState();
}

class _ExploreByGernreState extends State<ExploreByGernre> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          getGenreTile(Colors.blue, 'Action'),
          getGenreTile(Colors.red, 'Adventure'),
          getGenreTile(Colors.orange, 'Comedy'),
          getGenreTile(Colors.green, 'Drama'),
          getGenreTile(Colors.teal, 'Horror'),
        ],
      ),
    );
  }

  getGenreTile(Color genreTileColor, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: const Category()));
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 7.0, 15.0, 7.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: genreTileColor,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: whiteColor,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
