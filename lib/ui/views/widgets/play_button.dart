
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herovired/ui/usefull/palette.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key, this.height=30}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.colorGoalRed,
          border: Border.all(
            color: Palette.colorGoalRed,
          ),
          borderRadius: BorderRadius.all(Radius.circular(height))),
      //color: Palette.colorGoalRed,
      height: height,
      width: height,
      child: Icon(
        Icons.play_arrow,
        color: Palette.colorCardText,
        size: height*0.7,
      ),
    );
  }
}
