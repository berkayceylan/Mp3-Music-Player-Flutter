import 'package:flutter/material.dart';
import 'package:bc_mp3_player/utils/constants_styles.dart';
import 'package:bc_mp3_player/utils/constants_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayingBottom extends StatefulWidget {
  final Function onPlayPauseTap;
  final IconData playPauseIcon;
  PlayingBottom({this.onPlayPauseTap, this.playPauseIcon});
  @override
  _PlayingBottomState createState() => _PlayingBottomState();
}

class _PlayingBottomState extends State<PlayingBottom> {
  Color iconColor = kRedColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kActiveCardColor,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FaIcon(
            FontAwesomeIcons.redo,
            color: iconColor,
            size: 18,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: FaIcon(
                  FontAwesomeIcons.backward,
                  color: iconColor,
                  size: 30,
                ),
              ),
              InkWell(
                onTap: widget.onPlayPauseTap,
                child: FaIcon(
                  widget.playPauseIcon,
                  color: iconColor,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child:  FaIcon(
                  FontAwesomeIcons.fastForward,
                  color: iconColor,
                  size: 30,
                ),
              ),
            ],
          ),
          FaIcon(
            FontAwesomeIcons.random,
            size: 18,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
