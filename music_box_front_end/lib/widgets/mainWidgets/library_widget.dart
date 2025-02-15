import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class LibraryWidget extends StatefulWidget{
  const LibraryWidget({super.key});

  @override
  State<LibraryWidget> createState() => LibraryWidgetState();
}
class LibraryWidgetState extends State<LibraryWidget>{ 
  
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
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: Text("Library page", style: TextStyle(color:Colors.white),),
          )
        )
    );
  }
}