import 'package:bc_mp3_player/utils/constants_image.dart';
import 'package:bc_mp3_player/utils/constants_styles.dart';
import 'package:flutter/material.dart';
import 'package:bc_mp3_player/utils/constants_color.dart';
class MyListItemWithImage extends StatelessWidget {

  final Widget title;
  final Widget subTitle;
  final Widget leading;
  final double paddingBetweenItems;
  final double paddingContent;
  final Function onTap;
  MyListItemWithImage({this.onTap, this.title, this.subTitle, this.paddingBetweenItems, this.paddingContent, this.leading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: EdgeInsets.only(bottom: paddingBetweenItems),
          child: Card(
            color: kActiveCardColor.withOpacity(0),
            child: ListTile(
              contentPadding: EdgeInsets.all(this.paddingContent),
              leading: this.leading,
              title: title,
              subtitle: subTitle,
            ),
          ),
        ),
      ),
    );
  }
}
