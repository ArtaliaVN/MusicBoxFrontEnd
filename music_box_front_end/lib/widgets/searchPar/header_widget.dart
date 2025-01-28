import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/searchPar/navigation_button_widget.dart';
import 'package:music_box_front_end/widgets/searchPar/search_par_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavigationButtonWidget(icon: Icons.arrow_back_outlined, state: 1),
          NavigationButtonWidget(icon: Icons.arrow_forward_outlined, state: 2),
          SearchParWidget(),
        ],
      )
    );
  }
}