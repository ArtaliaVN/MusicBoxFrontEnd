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
          buildMenu(context, "Home", MyHomePage(), responsiveData, Icons.home),
          buildMenu(context, "Search", SearchPage(), responsiveData, Icons.search),
          buildMenu(context, "Sign in", SignInPage(), responsiveData, Icons.person),
        ],
      )
      :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildMenu(context, "Home", MyHomePage(), responsiveData, Icons.home),
          buildMenu(context, "Search", SearchPage(), responsiveData, Icons.search),
          buildMenu(context, "Sign in", SignInPage(), responsiveData, Icons.person),
        ],
      );
  }

  Widget buildMenu(BuildContext context, String title, Widget routeWidget, ResponsiveData responsiveData, IconData icon){
    return GestureDetector(
      onTap: () => setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => routeWidget),
        );
      }),
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
                icon,
                color:Colors.grey,
              ),
            ),
          
            Text(
              responsiveData.isLessThan600()? "": title,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color:Colors.grey,
              )
            ),
          ],
        ),
      ),
    );
  }
}