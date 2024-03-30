// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/localizations.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int notification = 2;

  final notificationList = [
    {
      'title': 'Watch Latest Web Series Now!',
      'description':
          'Watch latest web series now. All new web series are come. Tap on this to watch now.'
    },
    {
      'title': 'Upgrade Premium Now',
      'description': 'Upgrade premium now and get 52% off. Hurry up!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context)!
                .translate('notificationPage', 'notificationsString'),
            style: headingStyle),
      ),
      body: (notification == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    FontAwesomeIcons.bellSlash,
                    color: Colors.grey,
                    size: 60.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .translate('notificationPage', 'noNotificationsString'),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontFamily: 'Signika Negative',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                final item = notificationList[index];
                return Dismissible(
                  key: Key('$item'),
                  onDismissed: (direction) {
                    setState(() {
                      notificationList.removeAt(index);
                      notification--;
                    });

                    // Then show a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${item['title']} dismissed")));
                  },
                  // Show a red background as the item is swiped away.
                  background: Container(color: Colors.red),
                  child: Center(
                    child: Container(
                      width: width - 20.0,
                      margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: Card(
                        elevation: 2.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(10.0),
                              child: const CircleAvatar(
                                radius: 40.0,
                                child: Icon(
                                  FontAwesomeIcons.bell,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width - 130.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 8.0, left: 8.0),
                                    child: Text(
                                      '${item['title']}',
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Mukta'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8.0, bottom: 8.0),
                                    child: Text(
                                      '${item['description']}',
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          height: 1.6,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Mukta'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
