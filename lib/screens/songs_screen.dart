import 'dart:io';
import 'dart:math';

import 'package:bc_mp3_player/components/frontend/my_list_item_with_image.dart';
import 'package:bc_mp3_player/components/frontend/my_scaffold.dart';
import 'package:bc_mp3_player/database/helper_playlists.dart';
import 'package:bc_mp3_player/database/model/playlist.dart';
import 'package:bc_mp3_player/screens/playing_screen.dart';
import 'package:bc_mp3_player/utils/constants_image.dart';
import 'package:bc_mp3_player/utils/constants_styles.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:deepmusicfinder/deepmusicfinder.dart';

class SongsScreen extends StatefulWidget {
  static String id = '/songs';
  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  List<Map<dynamic, dynamic>> songsList = [];

  void getPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (statuses[Permission.storage] == PermissionStatus.granted) {
      fetchSongs();
    } else {
      //yapilacak
    }
  }

  fetchSongs() async {
    Deepmusicfinder dmf;
    dmf = new Deepmusicfinder();
    dynamic result = await dmf.fetchSong;

    setState(() {
      songsList = List.from(result["songs"]);
    });
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: Text('Song List'),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            songsList.length,
            (index) {
              Duration duration =
                  Duration(milliseconds: songsList[index]['Duration']);
              var song = songsList[index];
              song["Artist"] =
                  song["Artist"] == '<unknown>' ? 'Unknown' : song["Artist"];
              String randomCover = (Random().nextInt(3)).toString();
              Image image = song['Image'] == 'unknown'
                  ? Image.asset(
                      'assets/img/sample_covers/' + randomCover + '.jpg')
                  : Image.file(File.fromUri(Uri.parse(song['Image'])));

              return MyListItemWithImage(
                onTap: () async{
                  Map args = Map();
                  args['song'] = song;
                  args['songImage'] = image;

                  Navigator.of(context).pushNamed(PlayingScreen.id, arguments: args);

                  // Navigator.pushNamed(context, PlayingScreen.id, arguments: {'song': song});

                },
                title: Text(
                  song['Title'],
                  style: kTextStyleWhite,
                ),
                subTitle: Text(_printDuration(duration) + " - " +  song["Artist"]),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: image,
                ),
                paddingBetweenItems: 15.0,
                paddingContent: 10.0,
              );
            },
          ),
        ),
      ),
    );
  }
}
