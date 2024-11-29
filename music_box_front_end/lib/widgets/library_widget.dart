import 'package:flutter/material.dart';

class LibraryWidget extends StatefulWidget{
  const LibraryWidget({super.key});

  @override
  State<LibraryWidget> createState() => LibraryWidgetState();
}
class LibraryWidgetState extends State<LibraryWidget>{ 
  
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Container(
        
      ),
    );
  }
}