import 'package:bc_mp3_player/components/frontend/bottom.dart';
import 'package:bc_mp3_player/components/frontend/image_list.dart';
import 'package:bc_mp3_player/components/frontend/my_list_item_with_image.dart';
import 'package:bc_mp3_player/components/frontend/my_scaffold.dart';
import 'package:bc_mp3_player/database/helper_playlists.dart';
import 'package:bc_mp3_player/database/model/playlist.dart';
import 'package:bc_mp3_player/utils/constants_styles.dart';
import 'package:flutter/material.dart';

class PlaylistScreen extends StatefulWidget {
  static String id = "/playlist";
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  HelperPlaylists helperPlaylists;
  List<Playlist> allPlaylist = [];
  List<Playlist> listPlaylist = [];

  TextEditingController addNewPlaylist;

  void initDb() async {
    helperPlaylists = HelperPlaylists();
    Playlist playlist = Playlist(name: "playlist2", musicList: []);
    playlist.setMusicList(['str1', 'str2']);
    //playlists.insetDb(playlist);

    allPlaylist = await helperPlaylists.getAllPlaylists();
    setState(() {
      listPlaylist = allPlaylist;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addNewPlaylist = TextEditingController();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: Text(''),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: List.generate(
                listPlaylist.length,
                (index) => InkWell(
                  onLongPress: () async{
                    int _id = listPlaylist[index].id;
                    helperPlaylists.deleteRow(_id);
                    allPlaylist = await helperPlaylists.getAllPlaylists();

                    setState(() {
                      listPlaylist = allPlaylist;
                    });
                  },
                  child: MyListItemWithImage(
                    title: Text(
                      listPlaylist[index].name,
                      style: kTextStyleWhite,
                    ),
                    subTitle: Text(''),
                    leading: Icon(
                      Icons.playlist_play,
                      size: 40,
                    ),
                    paddingBetweenItems: 15.0,
                    paddingContent: 5.0,
                  ),
                ),
              ),
            ),
          ),
          Bottom(
              text: 'Add Playlist',
              onPressed: () {
                print('add playlist tabbed');
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Write playlist name'),
                        content: TextField(
                          controller: addNewPlaylist,
                        ),
                        actions: [
                          ElevatedButton(
                            child: Text('Okey'),
                            onPressed: () async {
                              String _newPlaylistName =
                                  addNewPlaylist.value.text;
                              Playlist playlist = Playlist(
                                  name: _newPlaylistName, musicList: []);
                              await helperPlaylists.insetDb(playlist);
                              allPlaylist =
                              await helperPlaylists.getAllPlaylists();
                              setState(() {
                                listPlaylist = allPlaylist;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ElevatedButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }
}
