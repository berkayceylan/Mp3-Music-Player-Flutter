import 'dart:async';

import 'package:bc_mp3_player/database/model/playlist.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class HelperPlaylists {
  String tableName = "playlists";
  static Database _db;
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'playlists.db');
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE playlists(id INTEGER PRIMARY KEY, name TEXT, musicList TEXT)");
  }

  Future<int> insetDb(Playlist playlist) async {
    var dbClient = await db;
    int _result = await dbClient.insert('playlists', playlist.toMap());
    return _result;
  }
  Future<int> deleteRow(int id) async {
    var dbClient = await db;
    int _result = await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return _result;
  }

  Future<List<Playlist>> getAllPlaylists() async {
    var dbClient = await db;
    List<Map> _list = await dbClient.rawQuery("SELECT * FROM playlists");
    List<Playlist> _allPlaylist = [];

    _list.forEach((element) {
      _allPlaylist.add(Playlist(
        name: element['name'],
        musicList: element['musicList'],
        id: element["id"],
      ));
    });

    return _allPlaylist;
  }
}
