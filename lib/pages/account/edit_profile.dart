// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:vidflix/functions/localizations.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String number = '9603456878';
  String email = 'test@abc.com';
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.text = number;
    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    changePhoneNumber() {
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
              height: 210.0,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.translate(
                        'editProfilePage', 'changePhoneNumberString'),
                    style: const TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    controller: phoneController,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mukta',
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.translate(
                          'editProfilePage', 'enterPhoneNumberString'),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Mukta',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('editProfilePage', 'cancelString'),
                            style: const TextStyle(
                              fontFamily: 'Mukta',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            number = phoneController.text;
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('editProfilePage', 'okayString'),
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
                ],
              ),
            ),
          );
        },
      );
    }

    changePassword() {
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
              height: 305.0,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.translate(
                        'editProfilePage', 'changeYourPasswordString'),
                    style: const TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mukta',
                    ),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!
                          .translate('editProfilePage', 'oldPasswordString'),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Mukta',
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mukta',
                    ),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!
                          .translate('editProfilePage', 'newPasswordString'),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Mukta',
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mukta',
                    ),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.translate(
                          'editProfilePage', 'confirmNewPasswordString'),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Mukta',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('editProfilePage', 'cancelString'),
                            style: const TextStyle(
                              fontFamily: 'Mukta',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('editProfilePage', 'okayString'),
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
                ],
              ),
            ),
          );
        },
      );
    }

    changeEmail() {
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
              height: 200.0,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!
                        .translate('editProfilePage', 'changeEmailString'),
                    style: const TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mukta',
                    ),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!
                          .translate('editProfilePage', 'enterEmailString'),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Mukta',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('editProfilePage', 'cancelString'),
                            style: const TextStyle(
                              fontFamily: 'Mukta',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            email = emailController.text;
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate('editProfilePage', 'okayString'),
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
                ],
              ),
            ),
          );
        },
      );
    }

    showUploadImageActionSheet() {
      return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
            title: Text(
                AppLocalizations.of(context)!
                    .translate('editProfilePage', 'chooseOptionsString'),
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.w500,
                    color: whiteColor)),
            message: Text(
              AppLocalizations.of(context)!
                  .translate('editProfilePage', 'yourOptionsAreString'),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('editProfilePage', 'cameraString'),
                ),
                onPressed: () {},
              ),
              CupertinoActionSheetAction(
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('editProfilePage', 'chooseFormGalleryString'),
                ),
                onPressed: () {},
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: Text(
                AppLocalizations.of(context)!
                    .translate('editProfilePage', 'cancelString'),
              ),
            )),
      );
    }

    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context)!
                .translate('editProfilePage', 'editProfileString'),
            style: headingStyle),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/user_profile/user.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    showUploadImageActionSheet();
                  },
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.black.withOpacity(0.5),
                    child: Icon(
                      Icons.add_a_photo,
                      color: whiteColor,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'Allison Perry',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.w500,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: width - 30.0,
                margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.translate(
                                  'editProfilePage', 'phoneNumberString'),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              number,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            changePhoneNumber();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey[400],
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('editProfilePage', 'emailString'),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              email,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            changeEmail();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey[400],
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.translate(
                                  'editProfilePage', 'passwordString'),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            const Text(
                              '******',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            changePassword();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey[400],
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
