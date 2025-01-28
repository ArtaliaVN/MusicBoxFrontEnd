import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';

class SettingWidget extends StatelessWidget{
  const SettingWidget({super.key,});

  @override
  createElement() {
    NavigatingSignal().getNav.record();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black38,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: BlurryContainer(
        child: Container(
          alignment: Alignment.topLeft,
          child: Text("Setting page", style: TextStyle(color:Colors.white),),
          )
        )
    );
  }
}