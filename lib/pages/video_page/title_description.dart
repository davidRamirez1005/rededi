import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TitleDescription extends StatefulWidget {
  const TitleDescription({Key? key}) : super(key: key);

  @override
  _TitleDescriptionState createState() => _TitleDescriptionState();
}

class _TitleDescriptionState extends State<TitleDescription> {
  bool favourite = false;

  void setFavourite() {
    setState(() {
      favourite = !favourite;
    });
    final snackBar = SnackBar(
      content: (favourite)
          ? Text('Added to Watch Later', style: TextStyle(color: Color.fromARGB(255, 19, 19, 19)))
          : Text('Remove from Watch Later',
              style: TextStyle(color: Colors.black)),
      backgroundColor: const Color.fromARGB(255, 250, 219, 219),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Función para abrir enlaces
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Widget de botón personalizado
  Widget customButton(String text, String url) {
    return InkWell(
      onTap: () {
        _launchURL(url);
      },
      child: Container(
        height: 64,
        width: 270,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0),
          color: Colors.white,
          border: Border.all(width: 1.0, color: Colors.black),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 19, 19, 19),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Nombre artista',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 245, 234, 234),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.queue_music_rounded,
                      color: Color.fromARGB(255, 253, 229, 229),
                      size: 35.0,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  InkWell(
                    onTap: setFavourite,
                    child: Icon(
                      (favourite) ? Icons.favorite : Icons.favorite_border,
                      color: Color.fromARGB(255, 253, 229, 229),
                      size: 35.0,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Container(
                    height: 44.0,
                    width: 44.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                      border: Border.all(width: 1.0, color: Colors.black),
                    ),
                    child: Container(
                      height: 38.0,
                      width: 38.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '5',
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 2.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 14.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 55),
          customButton('Youtube', 'https://www.youtube.com/'),
          customButton('Spotify', 'https://www.spotify.com/'),
          customButton('Apple Music', 'https://www.apple.com/music/'),
          customButton('Amazon Music', 'https://www.apple.com/music/'),
          customButton('Tidal', 'https://www.apple.com/music/'),
          customButton('Youtube Music', 'https://www.apple.com/music/'),
        ],
      ),
    );
  }
}
