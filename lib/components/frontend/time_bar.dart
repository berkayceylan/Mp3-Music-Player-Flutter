import 'package:flutter/material.dart';
import 'my_functions.dart';
class TimeBar extends StatefulWidget {
  final double val;
  final double max;
  final Function onChange;
  TimeBar({this.val, this.max, this.onChange});
  @override
  _TimeBarState createState() => _TimeBarState();
}

class _TimeBarState extends State<TimeBar> {
  double val = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    val = widget.val;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(MyFunctions.addZero(val ~/ 60) + ":" + MyFunctions.addZero((val % 60).toInt())),
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
              max: widget.max,
              value: val,
              onChanged: (val){
                setState(() {
                  this.val = val;
                  widget.onChange();
                });

              },
            ),
          ),
        ),
        Text('03.35')
      ],
    );
  }
}
