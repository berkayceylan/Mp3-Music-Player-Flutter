import 'package:bc_mp3_player/components/frontend/image_list.dart';
import 'package:bc_mp3_player/screens/playlist_screen.dart';
import 'package:bc_mp3_player/screens/home_screen.dart';
import 'package:bc_mp3_player/screens/playing_screen.dart';
import 'package:bc_mp3_player/screens/songs_screen.dart';
import 'package:flutter/material.dart';
import 'package:bc_mp3_player/utils/constants_str.dart';
import 'utils/constants_color.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff090C22),
        scaffoldBackgroundColor: kMainBackgroundColor.withOpacity(1),
      ),
      initialRoute: SongsScreen.id,
      // routes: {
      //
      //       SongsScreen.id : (context) => SongsScreen(),
      //       PlaylistScreen.id : (context) => PlaylistScreen(),
      // },
      onGenerateRoute: (RouteSettings settings){
        Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
          PlayingScreen.id : (context) => PlayingScreen(settings.arguments),
          SongsScreen.id : (context) => SongsScreen(),
          PlaylistScreen.id : (context) => PlaylistScreen(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },
    );
  }
}

