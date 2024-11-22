import 'package:flutter/cupertino.dart';
import 'package:music_box_front_end/widgets/header_widget.dart';
import 'package:music_box_front_end/widgets/search_result_widget.dart';

class DashBoardWidget extends StatelessWidget{
  const DashBoardWidget({super.key});


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
          child: SizedBox(
            child: SearchResultWidget(),
            ),
        ),
          
        ],
    );
  }

}