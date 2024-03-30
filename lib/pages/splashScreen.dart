// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/pages/login_signup/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.1, 0.3, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(1.0),
                  ],
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'VidFlix',
                      style: splashTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
