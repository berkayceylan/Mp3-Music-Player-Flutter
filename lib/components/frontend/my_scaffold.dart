import 'package:bc_mp3_player/components/frontend/my_drawer.dart';
import 'package:bc_mp3_player/screens/playing_screen.dart';
import 'package:bc_mp3_player/utils/constants_color.dart';
import 'package:bc_mp3_player/utils/constants_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:yasam_kocu_orj/components/my_drawer.dart';
import 'package:bc_mp3_player/screens/home_screen.dart';

class MyScaffold extends StatefulWidget {
  final Widget title;
  final Widget body;
  final Widget myLeading;
  final bool resizeToAvoidBottomPadding;
  static const emptyWidget = SizedBox();

  MyScaffold(
      {this.title,
      this.body,
      this.myLeading,
      this.resizeToAvoidBottomPadding = true});

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  //BottomNavigator

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //     image: AssetImage(kbackgroundImage),
        //     fit: BoxFit.fill
        // ),
      ),
      child: Scaffold(

        resizeToAvoidBottomInset: widget.resizeToAvoidBottomPadding,
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0),
          title: Row(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.chevronLeft),
                  onPressed: () {
                    try {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    } on Exception catch (ex) {
                      Navigator.pushNamed(context, HomeScreen.id);
                    }
                  },
                ),
              ),
              Padding(
                padding: widget.myLeading == null
                    ? const EdgeInsets.only(right: 0.0)
                    : const EdgeInsets.only(right: 15.0),
                child: widget.myLeading,
              ),
              widget.title,
            ],
          ),
        ),
        body: Container(

          child: widget.body,

        ),
      ),
    );
  }
}
