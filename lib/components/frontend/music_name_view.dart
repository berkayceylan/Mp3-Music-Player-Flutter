import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bc_mp3_player/utils/constants_styles.dart';
import 'package:marquee_widget/marquee_widget.dart';
class MusicNameView extends StatefulWidget {
  final String musicName;
  final String artistName;
  MusicNameView({this.musicName, this.artistName});
  @override
  _MusicNameViewState createState() => _MusicNameViewState();
}

class _MusicNameViewState extends State<MusicNameView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FaIcon(Icons.playlist_add_rounded),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 300,
                  child: Marquee(
                    child: Text(
                      widget.musicName,
                      style: kTitleText,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Marquee(
                    child: Text(
                      widget.artistName,
                      style: kTextStyle.copyWith(fontSize: 15),
                    ),
                  ),

                )
              ],
            ),
          ),
          FaIcon(Icons.queue_music),
        ],
      ),
    );
  }
}
