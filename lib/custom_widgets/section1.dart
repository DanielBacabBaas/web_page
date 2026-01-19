import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


// ignore: must_be_immutable
class Section1 extends StatefulWidget {
  final GlobalKey about;
  double screenHeight;
  double screenWidth;
  double text;
  double titles;
  double introductions;
  Section1({
    super.key,
    required this.about,
    required this.screenHeight,
    required this.screenWidth,
    required this.text,
    required this.titles,
    required this.introductions,
  });

  @override
  State<Section1> createState() => _Section1State();
}

class _Section1State extends State<Section1> {
  @override
  Widget build(BuildContext context) {
    bool isMobileVertical = widget.screenHeight > widget.screenWidth;

    return SliverToBoxAdapter(
      key: widget.about,
      child: Container(
        height: widget.screenHeight,
        color: const Color(0xff0b192f),
        alignment: Alignment.center,
        child: Container(
          height: isMobileVertical?(widget.screenHeight*.75):(widget.screenHeight * .8),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 10.0, color: Colors.grey),
              left: BorderSide(width: 10.0, color: Colors.grey),
              right: BorderSide(width: 10.0, color: Colors.grey),
              bottom: BorderSide(width: 10.0, color: Colors.grey),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: widget.screenWidth * .1,
              vertical: isMobileVertical?(widget.screenHeight * .0005):(widget.screenHeight * .05)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Profile",
                  style: TextStyle(
                      color: const Color(0xff61f7d5),
                      fontSize: widget.introductions)),
              const SizedBox(
                height: 10,
              ),
              Text("Daniel Bacab.",
                  style:
                      TextStyle(color: Colors.white, fontSize: widget.titles)),
                      const SizedBox(height: 10,),
              SizedBox(
                width: isMobileVertical?(widget.screenWidth * .8):(widget.screenWidth * .5),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text:
                              "Full-stack developer with experience in frontend (Vue, Flutter) and backend (Laravel). Experience in server administration (WHM/cPanel) and ERP development with e-commerce capabilities. Seeking full-stack roles where I can contribute to production projects and platform maintenance.",
                          style: TextStyle(
                              color: const Color(0xff8993af),
                              fontSize: widget.text)),
                     
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_openURL(url) async {
  url = Uri.parse(url);
  if (await launchUrl(url)) {
    await canLaunchUrl(url);
  } else {
    //print("Error");
  }
}
