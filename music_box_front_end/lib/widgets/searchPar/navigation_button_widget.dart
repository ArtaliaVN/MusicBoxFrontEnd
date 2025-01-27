import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget {
  final IconData icon;
  const NavigationButtonWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    IconData iconData = icon;
    return Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Icon(
              iconData,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 21,
              )
            );
  }
}