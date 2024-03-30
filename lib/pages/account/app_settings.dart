// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  bool status = false;
  bool standard = true;
  bool high = false;
  bool delete = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Container getDivider(Color color) {
      return Container(
        height: 1.0,
        width: width,
        margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        color: color,
      );
    }

    deleteVideosDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 280.0,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!
                        .translate('appSettingsPage', 'nothingToDeleteString'),
                    style: TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.red[400],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Icon(
                    Icons.hourglass_empty,
                    size: 60.0,
                    color: redColor,
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    AppLocalizations.of(context)!.translate(
                        'appSettingsPage', 'noDownloadedVideoString'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 15.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      width: width - 40.0,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('appSettingsPage', 'okayString'),
                        style: const TextStyle(
                          fontFamily: 'Mukta',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context)!
                .translate('appSettingsPage', 'appSettingsString'),
            style: headingStyle),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
            margin: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!
                      .translate('appSettingsPage', 'cellularDataString'),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mukta',
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.translate(
                            'appSettingsPage',
                            'cellularDataForDownloadsString'),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Mukta',
                        ),
                      ),
                    ),
                    CupertinoSwitch(
                      value: status,
                      onChanged: (value) {
                        status = value;
                        setState(
                          () {},
                        );
                      },
                      trackColor: redColor.withOpacity(0.3),
                      thumbColor: redColor,
                      activeColor: redColor.withOpacity(0.3),
                    ),
                    // CustomSwitch(
                    //   activeColor: redColor,
                    //   value: status,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       status = value;
                    //     });
                    //   },
                    // ),
                  ],
                ),
                getDivider(Colors.grey[700]!),
                const SizedBox(height: 10.0),
                Text(
                  AppLocalizations.of(context)!.translate(
                      'appSettingsPage', 'videoQualityForDownloadsString'),
                  style: headingStyle,
                ),
                const SizedBox(height: 15.0),
                InkWell(
                  onTap: () {
                    setState(() {
                      standard = true;
                      high = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Standard (recommended)',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                                fontFamily: 'Mukta',
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              AppLocalizations.of(context)!.translate(
                                  'appSettingsPage', 'downloadsFasterString'),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[400],
                                fontFamily: 'Mukta',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        (standard) ? Icons.check : null,
                        size: 25.0,
                        color: whiteColor,
                      ),
                    ],
                  ),
                ),
                getDivider(Colors.grey[700]!),
                InkWell(
                  onTap: () {
                    setState(() {
                      standard = false;
                      high = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'High Definition',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                              fontFamily: 'Mukta',
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            AppLocalizations.of(context)!.translate(
                                'appSettingsPage', 'useMoreStorageString'),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                              fontFamily: 'Mukta',
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        (high) ? Icons.check : null,
                        size: 25.0,
                        color: whiteColor,
                      ),
                    ],
                  ),
                ),
                getDivider(Colors.grey[700]!),
                const SizedBox(height: 10.0),
                InkWell(
                  onTap: () {
                    deleteVideosDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: width - 80.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.translate(
                                  'appSettingsPage',
                                  'deleteAllDownloadsString'),
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Mukta',
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              AppLocalizations.of(context)!.translate(
                                  'appSettingsPage',
                                  'removeAllDownloadsString'),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[400],
                                fontFamily: 'Mukta',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25.0,
                      ),
                    ],
                  ),
                ),
                getDivider(Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
