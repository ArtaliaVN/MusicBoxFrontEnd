import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/data/panel_data.dart';

class SideMenuWidget extends StatefulWidget {
  final NavigatingSignal navigatingSignal;
  const SideMenuWidget({super.key, required this.navigatingSignal});

  @override
  State<StatefulWidget> createState() => _SideMenyWidgetState(); 
}

class _SideMenyWidgetState extends State<SideMenuWidget> {

  @override
  Widget build(BuildContext context) {
    final data= PanelData();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      );
  }

  Widget buildMenuEntry(PanelData data, int index){
    int selectedIndex = widget.navigatingSignal.getNavSignal;
    final isSelected = selectedIndex == index;
    return InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
          widget.navigatingSignal.toggleSignal(false);
          widget.navigatingSignal.setNavSignal(index);
        }),
        borderRadius: BorderRadius.circular(15),
        hoverColor:isSelected?null: Colors.white,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius:  const BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: isSelected? Colors.white.withAlpha(50) : Colors.transparent,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Icon(
                  data.menu[index].icon,
                  color: isSelected? Colors.white : Colors.grey,
                ),
              ),
            
              Text(
                data.menu[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: isSelected? Colors.white : Colors.grey,
                )
                ),
            ],
          ),
        )
      );
  }  
}