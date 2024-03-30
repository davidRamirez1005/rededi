import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaList extends StatefulWidget {
  const SocialMediaList({Key? key}) : super(key: key);

  @override
  _SocialMediaListState createState() => _SocialMediaListState();
}

class _SocialMediaListState extends State<SocialMediaList> {
  final List<Map<String, dynamic>> socialMediaList = [
    {
      'icon': FontAwesomeIcons.facebookF,
      'url': 'https://www.facebook.com', // Reemplaza esto con tu URL de Facebook
    },
    {
      'icon': FontAwesomeIcons.xTwitter,
      'url': 'https://www.twitter.com', // Reemplaza esto con tu URL de Twitter
    },
    {
      'icon': FontAwesomeIcons.instagram,
      'url': 'https://www.instagram.com', // Reemplaza esto con tu URL de Instagram
    },
    {
      'icon': FontAwesomeIcons.tiktok,
      'url': 'https://www.tiktok.com', // Reemplaza esto con tu URL de LinkedIn
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 150.0,
      child: ListView.builder(
        itemCount: socialMediaList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = socialMediaList[index];
          return InkWell(
            onTap: () async {
              String? url = item['url'] as String?;
              if (url != null && await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 40.0, // Ajusta el tamaño del círculo aquí
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    item['icon'],
                    size: 60.0, // Puedes ajustar el tamaño del icono aquí
                    color: Color.fromARGB(255, 20, 19, 19), // Puedes ajustar el color del icono aquí
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