import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:vidflix/constant/constant.dart';
import 'package:vidflix/pages/video_play/video_play.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 440.0,
      width: width,
      child: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: 350.0,
            margin: const EdgeInsets.only(
                top: 60.0, bottom: 40.0, right: 20.0, left: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200.0),
              image: const DecorationImage(
                image: NetworkImage("https://mybucketgatos.s3.us-east-2.amazonaws.com/josedavid.jpg.jpeg"),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Color.fromARGB(255, 223, 223, 223), // Color del borde
                width: 3.0, // Ancho del borde
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: ((width / 2) - 30.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(30.0),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.scale,
                        alignment: Alignment.bottomCenter,
                        child: const VideoPlay()
                        ));
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color.fromARGB(255, 240, 229, 229),
                ),
                child: Icon(Icons.verified, color: Color.fromARGB(255, 198, 22, 22), size: 50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
