class Playlist{
  int id;
  String name;
  var musicList;

  Playlist({this.id = 0, this.name, this.musicList}){
    this.musicList = this.musicList.toString();
  }

  void setMusicList(List<String> arr){
    this.musicList = arr.toString();
  }
  void setId(int id){
    this.id = id;
  }

  Playlist.map(dynamic obj){
    this.name = obj['name'];
    this.musicList = obj['musicList'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["musicList"] = musicList;
    return map;
  }


}