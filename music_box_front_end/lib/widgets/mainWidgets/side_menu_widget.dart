import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/widgets/pageWidgets/my_home_page.dart';
import 'package:music_box_front_end/widgets/pageWidgets/search_page.dart';
import 'package:music_box_front_end/widgets/pageWidgets/sign_in_page.dart';
class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SideMenyWidgetState(); 
}

class _SideMenyWidgetState extends State<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    ResponsiveData responsiveData = ResponsiveData(context: context);
    return responsiveData.isLessThan400()? 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SideMenuButtonWidget(title: "Home", routeWidget: MyHomePage(), responsiveData: responsiveData, icon: Icons.home),
          SideMenuButtonWidget(title: "Search", routeWidget: SearchPage(), responsiveData: responsiveData, icon: Icons.search),
          SideMenuButtonWidget(title: "Sign in", routeWidget: SignInPage(), responsiveData: responsiveData, icon: Icons.person),
        ],
      )
      :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SideMenuButtonWidget(title: "Home", routeWidget: MyHomePage(), responsiveData: responsiveData, icon: Icons.home),
          SideMenuButtonWidget(title: "Search", routeWidget: SearchPage(), responsiveData: responsiveData, icon: Icons.search),
          SideMenuButtonWidget(title: "Sign in", routeWidget: SignInPage(), responsiveData: responsiveData, icon: Icons.person),
        ],
      );
  }
}

class SideMenuButtonWidget extends StatefulWidget{
  final String title;
  final Widget routeWidget;
  final ResponsiveData responsiveData;
  final IconData icon;

  const SideMenuButtonWidget({super.key, required this.title, required this.routeWidget, required this.responsiveData, required this.icon});

  @override
  State<SideMenuButtonWidget> createState() => SideMenuButtonState();
}

class SideMenuButtonState extends State<SideMenuButtonWidget>{
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => {
          setState(() {isHovered = true;}) 
      },
      onExit: (e) => {
          setState(() {isHovered = false;})
      },
      child: GestureDetector(
        onTap: () => setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.routeWidget),
          );
        }),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius:  const BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: isHovered? Colors.black38 : Colors.transparent,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Icon(
                  widget.icon,
                  color:isHovered? Colors.white :Colors.grey,
                ),
              ),
            
              Text(
                widget.responsiveData.isLessThan600()? "": widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color:isHovered? Colors.white :Colors.grey,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}