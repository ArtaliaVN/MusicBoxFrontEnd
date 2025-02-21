import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/models/panel_model.dart';

class SideMenuWidget extends StatefulWidget {
  final NavigatingSignal navigatingSignal;
  final List<PanelModel> menu;
  const SideMenuWidget({super.key, required this.navigatingSignal, required this.menu});

  @override
  State<StatefulWidget> createState() => _SideMenyWidgetState(); 
}

class _SideMenyWidgetState extends State<SideMenuWidget> {
  
  @override
  Widget build(BuildContext context) {
    ResponsiveData responsiveData = ResponsiveData(context: context);
    return responsiveData.isLessThan400()? GridView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => buildMenuEntry(index, responsiveData), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      ):
      ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => buildMenuEntry(index, responsiveData),
      );
  }

  Widget buildMenuEntry(int index, ResponsiveData responsiveData){
    int selectedIndex = widget.navigatingSignal.getNavSignal;
    final isSelected = selectedIndex == index;
    return InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
          widget.navigatingSignal.setNavSignal(index);
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
                  widget.menu[index].icon,
                  color:Colors.grey,
                ),
              ),
            
              Text(
                responsiveData.isLessThan600()? "":widget.menu[index].title,
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