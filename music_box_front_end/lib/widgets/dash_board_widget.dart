import 'package:flutter/cupertino.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/data/side_menu_data.dart';
import 'package:music_box_front_end/widgets/header_widget.dart';
import 'package:music_box_front_end/widgets/song_detailed_page_widget.dart';

class DashBoardWidget extends StatelessWidget{
  final NavigatingSignal navigatingSignal;
  const DashBoardWidget({super.key, required this.navigatingSignal});

  @override
  Widget build(BuildContext context) {
    final SideMenuData data = SideMenuData();
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
              return navigatingSignal.viewSignal?
              SongDetailedPageWidget(song: navigatingSignal.getSong,)
              :
              data.menu[navigatingSignal.getNavSignal].widget;},
            ),
        ),
        ],
    );
  }
}