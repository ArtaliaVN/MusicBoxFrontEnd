import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/history_list.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';

class NavigationButtonWidget extends StatelessWidget {
  final IconData icon;
  final int state; 
  const NavigationButtonWidget({required this.icon, required this.state});

  @override
  Widget build(BuildContext context) {
    IconData iconData = icon;
    return InkWell(
      onTap: () => (
        HistoryList().navigation(state, NavigatingSignal().getNav)
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