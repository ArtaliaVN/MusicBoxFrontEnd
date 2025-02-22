import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget{
  final String text;
  final double width;
  String data = "";
  final bool hideText;
  TextfieldWidget({super.key, required this.text, required this.width, required this.hideText});
  
  @override
  State<TextfieldWidget> createState() => TextfieldState();
}

class TextfieldState extends State<TextfieldWidget>{
  final myController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    myController.addListener(getData);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }


  void getData(){
    final textInput = myController.text;
    setState(() {
      widget.data = textInput;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.hideText,
      controller: myController,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: 35, maxWidth: widget.width,),
        filled: true,
        fillColor: Color.fromARGB(255, 218, 217, 223),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        hintText: widget.text,
      ),
    );
  }
}