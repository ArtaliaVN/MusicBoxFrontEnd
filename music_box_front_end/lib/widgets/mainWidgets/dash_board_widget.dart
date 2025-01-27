import 'package:flutter/cupertino.dart';
import 'package:music_box_front_end/data/panel_data.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';
import 'package:music_box_front_end/widgets/searchPar/header_widget.dart';

class DashBoardWidget extends StatelessWidget{
  const DashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PanelData data = PanelData();
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
            listenable: NavigatingSignal().getNav,
            builder: (BuildContext context, Widget? child) {
              return data.menu[NavigatingSignal().getNav.getNavSignal].widget;},
            ),
        ),

        Visibility(
          visible: false,
          child: Expanded(
            flex: 0,
            child: Container()
          ),
        )
        ],
    );
  }
}