import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlbumCoverWithIcons extends StatefulWidget {
  final Image image;
  AlbumCoverWithIcons({this.image});
  @override
  _AlbumCoverWithIconsState createState() => _AlbumCoverWithIconsState();
}

class _AlbumCoverWithIconsState extends State<AlbumCoverWithIcons> {
  static const childPadding = 25.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          widget.image,
          Padding(
            padding: EdgeInsets.all(childPadding),
            child: FaIcon(FontAwesomeIcons.solidHeart),
          ),
          Container(
            padding: EdgeInsets.all(childPadding),
            alignment: Alignment.bottomRight,
            child: FaIcon(FontAwesomeIcons.camera),
          )
        ],
      ),
    );
  }
}
