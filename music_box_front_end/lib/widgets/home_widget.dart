import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget{
  const HomeWidget({super.key});
  
  @override
  Widget build(Object context) {
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
          child: Text("Home page", style: TextStyle(color:Colors.white),),
          )
        )
    );
  }
}