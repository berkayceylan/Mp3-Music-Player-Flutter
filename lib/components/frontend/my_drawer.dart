import 'package:bc_mp3_player/screens/playlist_screen.dart';
import 'package:bc_mp3_player/screens/songs_screen.dart';
import 'package:flutter/material.dart';
import 'package:bc_mp3_player/utils/constants_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bc_mp3_player/screens/home_screen.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kActiveCardColor,
        child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
        SizedBox(height: 50.0,),
          ListTile(
            title: Text('Playlists'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, PlaylistScreen.id);
            },
          ),
          ListTile(
            title: Text('Songs'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, SongsScreen.id);
            },
          ),
          Divider(),

          ListTile(
            title: Text('Test Alanı'),
            leading: Icon(Icons.apps),
            onTap: () {
              Navigator.pushNamed(context, SongsScreen.id);

            },
          ),

          ListTile(
              title: Text('Kapat'),
              leading: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              }),
        ]),
      ),
    );
  }
}
