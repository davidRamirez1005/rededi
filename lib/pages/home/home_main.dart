// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';
import 'package:vidflix/pages/category/more_list.dart';
import 'package:vidflix/pages/category/more_artistas.dart';
import 'package:vidflix/pages/home/home_component/best_of_kids.dart';
import 'package:vidflix/pages/home/home_component/explore_by_genre.dart';
import 'package:vidflix/pages/home/home_component/main_slider.dart';
import 'package:vidflix/pages/home/home_component/multiplex_movies.dart';
import 'package:vidflix/pages/home/home_component/popular_movies.dart';
import 'package:vidflix/pages/home/home_component/special_latest_movies.dart';
import 'package:vidflix/pages/notification.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          'REDEDI',
          style: headingStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, color: whiteColor),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.size,
                      alignment: Alignment.bottomCenter,
                      child: const Notifications()));
            },
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const MainSlider(),
          heightSpace,
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Text(
              AppLocalizations.of(context)!
                  .translate('homePage', 'exploreByGenreString'),
              style: headingStyle,
            ),
          ),
          const ExploreByGernre(),
          heightSpace,
          Padding(
            padding: EdgeInsets.all(fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!
                      .translate('homePage', 'specialAndLatestMoviesString'),
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
                          .translate('homePage', 'moreString'),
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
                      .translate('homePage', 'multiplexMoviesString'),
                  style: headingStyle,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: const MoreArtist()));
                  },
                  child: Text(
                      AppLocalizations.of(context)!
                          .translate('homePage', 'moreString'),
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
                      .translate('homePage', 'popularMoviesString'),
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
                          .translate('homePage', 'moreString'),
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
                      .translate('homePage', 'bestOfKidsString'),
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
                          .translate('homePage', 'moreString'),
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
