import 'dart:async';

import 'package:bc_mp3_player/components/frontend/album_cover_with_icons.dart';
import 'package:bc_mp3_player/components/frontend/music_name_view.dart';
import 'package:bc_mp3_player/components/frontend/my_functions.dart';
import 'package:bc_mp3_player/components/frontend/my_scaffold.dart';
import 'package:bc_mp3_player/components/frontend/playing_bottom.dart';
import 'package:bc_mp3_player/components/frontend/time_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';

class PlayingScreen extends StatefulWidget {
  static String id = "/PlayingScreen";
  final Map args;

  PlayingScreen(this.args);

  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  AudioPlayer player;
  Image img;
  String musicName;
  String artistName;
  int currentSeconds = 0;
  int duration = 100;

  IconData playPauseIcon = FontAwesomeIcons.print;
  StreamSubscription positionStreamSubscription;
  var song;

  void disposePlayer() async {
    positionStreamSubscription.cancel();
    await player.dispose();
  }

  void initPlayer() async {
    await player.setUrl(song['path']);
    await player.pause();
    duration = player.duration.inSeconds;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(MyFunctions.secondsToMinutes(102));
    song = widget.args['song'];
    player = AudioPlayer();

    positionStreamSubscription = player.positionStream.listen((event) {
      setState(() {
        currentSeconds = event.inSeconds;
      });
    });

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.ready) {
        setState(() {
          if (state.playing) {
            playPauseIcon = FontAwesomeIcons.pause;
          } else {
            playPauseIcon = FontAwesomeIcons.play;
          }
        });
      }
    });

    img = widget.args['songImage'];
    musicName = song['Title'];
    artistName = song["Artist"];

    initPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: Text(''),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: AlbumCoverWithIcons(
                image: img,
            ),
          ),
          Column(children: [
            MusicNameView(
              musicName: musicName,
              artistName: artistName,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(MyFunctions.addZero(currentSeconds ~/ 60) + ":" + MyFunctions.addZero((currentSeconds % 60).toInt())),
                  Flexible(
                    flex: 2,
                    child: SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.red[700],
                        inactiveTrackColor: Colors.red[100],
                        trackShape: RectangularSliderTrackShape(),
                        trackHeight: 1.0,
                        thumbColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0),
                        overlayColor: Colors.red.withAlpha(32),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      child: Slider(
                        min: 0,
                        max: duration.toDouble(),
                        value: this.currentSeconds.toDouble(),

                        onChanged: (val){
                          setState(() {
                            player.seek(Duration(seconds: val.toInt()));
                          });
                        },
                      ),
                    ),
                  ),
                  Text(MyFunctions.secondsToMinutes(duration.toDouble()))
                ],
              ),
            ),
          ]),
          PlayingBottom(
            playPauseIcon: playPauseIcon,
            onPlayPauseTap: () async {
              if (player.playing) {
                await player.pause();
              } else {
                await player.play();
              }
            },
          ),
        ],
      ),
    );
  }
}
