// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';
import 'package:vidflix/pages/account/account.dart';
import 'package:vidflix/pages/home/home_main.dart';
import 'package:vidflix/pages/search.dart';
import 'package:vidflix/pages/watch_later.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? currentIndex;
  DateTime? currentBackPressTime;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          child: StylishBottomBar(
            backgroundColor: blackColor,
            option: BubbleBarOptions(
              barStyle: BubbleBarStyle.horizotnal,
              // barStyle: BubbleBarStyle.vertical,
              bubbleFillStyle: BubbleFillStyle.fill,
              // bubbleFillStyle: BubbleFillStyle.outlined,
              opacity: 0.3,
            ),
            items: [
              BottomBarItem(
                backgroundColor: Colors.red,
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                selectedIcon: const Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                title: Text(
                    AppLocalizations.of(context)!
                        .translate('bottomBar', 'homeString'),
                    style: const TextStyle(fontSize: 12.0)),
              ),
              BottomBarItem(
                backgroundColor: Colors.red,
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                selectedIcon: const Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                title: Text(
                    AppLocalizations.of(context)!
                        .translate('bottomBar', 'searchString'),
                    style: const TextStyle(fontSize: 12.0)),
              ),
              BottomBarItem(
                backgroundColor: Colors.red,
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                selectedIcon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                title: Text(
                    AppLocalizations.of(context)!
                        .translate('bottomBar', 'watchLaterString'),
                    style: const TextStyle(fontSize: 12.0)),
              ),
              BottomBarItem(
                backgroundColor: Colors.red,
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                selectedIcon: const Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                title: Text(
                    AppLocalizations.of(context)!
                        .translate('bottomBar', 'accountString'),
                    style: const TextStyle(fontSize: 12.0)),
              ),
            ],
            hasNotch: false,
            currentIndex: currentIndex!,
            onTap: changePage,
          ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool key) {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
        },
        child: (currentIndex == 0)
            ? const HomeMain()
            : (currentIndex == 1)
                ? const Search()
                : (currentIndex == 2)
                    ? const WatchLater()
                    : const Account(),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!
            .translate('bottomBar', 'pressBackOnceAgainString'),
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
