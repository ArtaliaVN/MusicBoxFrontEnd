import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget{
  const SettingWidget({super.key,});

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
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          alignment: Alignment.topLeft,
          child: Text("Setting page", style: TextStyle(color:Colors.white),),
          )
        )
    );
  }
}