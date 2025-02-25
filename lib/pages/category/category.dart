// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';
import 'package:vidflix/pages/category/more_list.dart';
import 'package:vidflix/pages/category/production_studio_list.dart';
import 'package:vidflix/pages/home/home_component/best_of_kids.dart';
import 'package:vidflix/pages/home/home_component/main_slider.dart';
import 'package:vidflix/pages/home/home_component/multiplex_movies.dart';
import 'package:vidflix/pages/home/home_component/popular_movies.dart';
import 'package:vidflix/pages/home/home_component/special_latest_movies.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Action',
          style: headingStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const MainSlider(),
          heightSpace,
          const ProductionStudioList(),
          heightSpace,
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!
                      .translate('categoryPage', 'newMoviesString'),
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
                          .translate('categoryPage', 'moreString'),
                      style: linkStyle),
                ),
              ],
            ),
          ),
          const SpecialLatestMoviesList(),
          heightSpace,
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!
                      .translate('categoryPage', 'hitMoviesString'),
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
                          .translate('categoryPage', 'moreString'),
                      style: linkStyle),
                ),
              ],
            ),
          ),
          const MultiPlexMoviesList(),
          heightSpace,
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!
                      .translate('categoryPage', 'popularMoviesString'),
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
                          .translate('categoryPage', 'moreString'),
                      style: linkStyle),
                ),
              ],
            ),
          ),
          const PopularMoviesList(),
          heightSpace,
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!
                      .translate('categoryPage', 'trendingString'),
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
                          .translate('categoryPage', 'moreString'),
                      style: linkStyle),
                ),
              ],
            ),
          ),
          const BestOfKidsList(),
          heightSpace,
        ],
      ),
    );
  }
}
