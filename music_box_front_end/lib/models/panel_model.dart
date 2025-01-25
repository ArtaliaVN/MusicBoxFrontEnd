import 'package:flutter/material.dart';

class PanelModel{
  final IconData icon;
  final String title; 
  final Widget widget;

  const PanelModel(
    {
      required this.icon, 
      required this.title, 
      required this.widget,
    }
  );
}