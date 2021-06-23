import 'package:bc_mp3_player/utils/constants_image.dart';
import 'package:bc_mp3_player/utils/constants_styles.dart';
import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              child: Image.asset(ksampleCover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Playlist 1", style: kTextStyleWhite,),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              child: Image.asset(ksampleCover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 10.0,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Playlist 1", style: kTextStyleWhite,),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              child: Image.asset(ksampleCover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Playlist 1", style: kTextStyleWhite,),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              child: Image.asset(ksampleCover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 10.0,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Playlist 1", style: kTextStyleWhite,),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              child: Image.asset(ksampleCover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Playlist 1", style: kTextStyleWhite,),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              child: Image.asset(ksampleCover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 10.0,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Playlist 1", style: kTextStyleWhite,),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              child: Image.asset(ksampleCover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Playlist 1", style: kTextStyleWhite,),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Card(
                              child: Image.asset(ksampleCover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 10.0,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Playlist 1", style: kTextStyleWhite,),
                                Icon(Icons.more_vert),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0,),
            ],
          ),
        ),

      ),
    );
  }
}
