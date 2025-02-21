import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/searchPar/search_par_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchParWidget(),
        ],
      )
    );
  }
}