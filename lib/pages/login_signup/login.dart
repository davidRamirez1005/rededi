// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';
import 'package:vidflix/pages/login_signup/signup.dart';
import 'package:vidflix/pages/login_signup/forgot_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DateTime? currentBackPressTime;

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
            ),
          ),
          Positioned(
            child: PopScope(
              canPop: false,
              onPopInvoked: (bool key) {
                bool backStatus = onWillPop();
                if (backStatus) {
                  exit(0);
                }
              },
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Padding(
                      padding: EdgeInsets.only(
                          top: fixPadding * 2,
                          left: fixPadding * 2,
                          right: fixPadding * 2.0),
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('loginPage', 'welcomeBackString'),
                        style: loginBigTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: fixPadding * 2, right: fixPadding * 2.0),
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('loginPage', 'loginYourAccountString'),
                        style: thickStyle,
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Padding(
                      padding: EdgeInsets.only(
                          right: fixPadding * 2, left: fixPadding * 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200]!.withOpacity(0.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          style: headingStyle,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            hintText: AppLocalizations.of(context)!
                                .translate('loginPage', 'emailString'),
                            hintStyle: headingStyle,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    heightSpace,
                    Padding(
                      padding: EdgeInsets.only(
                          right: fixPadding * 2, left: fixPadding * 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200]!.withOpacity(0.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          style: headingStyle,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            hintText: AppLocalizations.of(context)!
                                .translate('loginPage', 'passwordString'),
                            hintStyle: headingStyle,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    Padding(
                      padding: EdgeInsets.only(
                          right: fixPadding * 2, left: fixPadding * 2),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const Signup()));
                        },
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.1, 0.5, 0.9],
                              colors: [
                                Colors.red[300]!.withOpacity(0.8),
                                Colors.red[500]!.withOpacity(0.8),
                                Colors.red[800]!.withOpacity(0.8),
                              ],
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('loginPage', 'loginString'),
                            style: headingStyle,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(fixPadding),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const ForgotPassword()));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(fixPadding),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('loginPage', 'forgotPasswordString'),
                            style: headingStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: fixPadding * 2, left: fixPadding * 2),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const Signup()));
                        },
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.1, 0.5, 0.9],
                              colors: [
                                Colors.red[300]!.withOpacity(0.8),
                                Colors.red[500]!.withOpacity(0.8),
                                Colors.red[800]!.withOpacity(0.8),
                              ],
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.translate(
                                'loginPage', 'dontHaveAccountString'),
                            style: headingStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
            .translate('loginPage', 'pressBackOnceAgainString'),
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
