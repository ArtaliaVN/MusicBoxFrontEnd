import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';
import 'package:music_box_front_end/data/panel_data.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SideMenyWidgetState(); 
}

class _SideMenyWidgetState extends State<SideMenuWidget> {

  @override
  Widget build(BuildContext context) {
    final data= PanelData();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      );
  }

  Widget buildMenuEntry(PanelData data, int index){
    int selectedIndex = NavigatingSignal().getNav.getNavSignal;
    final isSelected = selectedIndex == index;
    return InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
          NavigatingSignal().getNav.setNavSignal(index);
        }),
        borderRadius: BorderRadius.circular(15),
        hoverColor:isSelected?null: Colors.white,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius:  const BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Icon(
                  data.menu[index].icon,
                  color:Colors.grey,
                ),
              ),
            
              Text(
                data.menu[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color:Colors.grey,
                )
                ),
            ],
          ),
        )
      );
  }  
}