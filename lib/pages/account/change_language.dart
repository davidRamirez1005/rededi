// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/functions/change_language.dart';
import 'package:vidflix/functions/localizations.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool progress = false;

    var appLanguage = Provider.of<AppLanguage>(context);

    Locale myLocale = Localizations.localeOf(context);

    changeLanguage(String language) {
      setState(() {
        progress = true;
      });
      if (language == 'english') {
        appLanguage.changeLanguage(const Locale("en"));
        setState(() {
          progress = false;
          myLocale = const Locale("en");
        });
      }

      if (language == 'hindi') {
        appLanguage.changeLanguage(const Locale("hi"));
        setState(() {
          progress = false;
          myLocale = const Locale("hi");
        });
      }

      if (language == 'arabic') {
        appLanguage.changeLanguage(const Locale("ar"));
        setState(() {
          progress = false;
          myLocale = const Locale("ar");
        });
      }

      if (language == 'chinese') {
        appLanguage.changeLanguage(const Locale("zh"));
        setState(() {
          progress = false;
          myLocale = const Locale("zh");
        });
      }
    }

    nothingHappen() {}

    // Change Language AlertDialog Start Here
    changeLanguageDialogue(String languageToChange) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Wrap(
              children: <Widget>[
                Container(
                  width: width,
                  height: 150.0,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage('assets/earth.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        AppLocalizations.of(context)!.translate(
                            'changeLanguagePage', 'sureDialogueString'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Row(
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
                                AppLocalizations.of(context)!.translate(
                                    'changeLanguagePage', 'closeString'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              changeLanguage(languageToChange);
                            },
                            child: Container(
                              width: (width / 3.5),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.translate(
                                    'changeLanguagePage', 'yesString'),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    // Change Language AlertDialog Ends Here
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context)!
                .translate('changeLanguagePage', 'changeLanguageAppBarTitle'),
            style: headingStyle),
      ),
      body: (progress)
          ? const Center(
              child: SpinKitRipple(color: Colors.red),
            )
          : ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .translate('changeLanguagePage', 'selectLanguage'),
                        style: bigTextStyle,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          (myLocale.languageCode == 'en')
                              ? nothingHappen()
                              : changeLanguageDialogue('english');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 1.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/country_flag/english.png',
                                height: 40.0,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  AppLocalizations.of(context)!.translate(
                                      'changeLanguagePage', 'englishString'),
                                  style: headingStyle),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          (myLocale.languageCode == 'hi')
                              ? nothingHappen()
                              : changeLanguageDialogue('hindi');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 1.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/country_flag/hindi.png',
                                height: 40.0,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  AppLocalizations.of(context)!.translate(
                                      'changeLanguagePage', 'hindiString'),
                                  style: headingStyle),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          (myLocale.languageCode == 'ar')
                              ? nothingHappen()
                              : changeLanguageDialogue('arabic');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 1.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/country_flag/arabic.png',
                                height: 40.0,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  AppLocalizations.of(context)!.translate(
                                      'changeLanguagePage', 'arabicString'),
                                  style: headingStyle),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          (myLocale.languageCode == 'zh')
                              ? nothingHappen()
                              : changeLanguageDialogue('chinese');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: (width - 20.0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 1.5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/country_flag/chinese.png',
                                height: 40.0,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                  AppLocalizations.of(context)!.translate(
                                      'changeLanguagePage', 'chineseString'),
                                  style: headingStyle),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
