import 'package:flutter/material.dart';

class ResponsiveData{
  final BuildContext context;
  ResponsiveData({required this.context});

  bool isLessThan400(){
    return (MediaQuery.sizeOf(context).width <= 400);
  }

  bool isLessThan600(){
    return (MediaQuery.sizeOf(context).width <= 600);
  }

  bool isBetween400And600(){
    return (MediaQuery.sizeOf(context).width > 400 && MediaQuery.sizeOf(context).width <= 600);
  }

  bool isLessThan800(){
    return (MediaQuery.sizeOf(context).width <= 800);
  }
}