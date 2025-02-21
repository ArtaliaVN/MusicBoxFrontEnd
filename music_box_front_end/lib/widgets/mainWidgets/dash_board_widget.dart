
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/models/panel_model.dart';
import 'package:music_box_front_end/widgets/searchPar/header_widget.dart';

class DashBoardWidget extends StatelessWidget{
  final NavigatingSignal navigatingSignal;
  final List<PanelModel> menu;
  const DashBoardWidget({super.key, required this.navigatingSignal, required this.menu});

  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        Expanded(
          flex: 0,
          child: SizedBox(
            child: HeaderWidget(),
            ),
        ),

        Expanded(
          flex: 1,
          child: ListenableBuilder(
            listenable: navigatingSignal,
            builder: (BuildContext context, Widget? child) {
              return menu[navigatingSignal.getNavSignal].widget;},
            ),
        ),
        ],
    );
  }
}