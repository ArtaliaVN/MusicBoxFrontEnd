import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget {
  final IconData icon;
  final int state; 
  const NavigationButtonWidget({required this.icon, required this.state});

  @override
  Widget build(BuildContext context) {
    IconData iconData = icon;
    return InkWell(
      onTap: () => (
        ),
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Icon(
          iconData,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 21,
          )
        ),
      );
  }
  }