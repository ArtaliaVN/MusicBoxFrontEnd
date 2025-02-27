import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/widgets/mainWidgets/home_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/side_menu_widget.dart';
import 'package:music_box_front_end/widgets/searchPar/header_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  
  @override
  Widget build(BuildContext context){
    final ResponsiveData responsiveData = ResponsiveData(context: context);
    final SideMenuWidget sideMenuWidget = SideMenuWidget();
    
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background1.jpg"),
          fit: BoxFit.cover,
          )
        ),
        child: responsiveData.isLessThan400()? 
        Column(
          children: [
            //Dash board
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    flex:1,
                    child: Column(
                      children: [
                        Expanded(
                        flex: 0,
                        child: SizedBox(
                          child: HeaderWidget(),
                          ),
                        ),
    
                        Expanded(
                          flex: 1,
                          child: HomeWidget(),
                        ),
                      ],
                    ),
                    ),
                  ],
                ),
              ),
              //Left tools par
              Expanded(
                flex:0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: SizedBox(
                    width: responsiveData.isBetween400And600()? 50 : 220,
                    child: sideMenuWidget
                    ),
                )
              ),
          ],  
        ):
        
        Row(
          children: [
            //Left tools par
            Expanded(
              flex:0,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: SizedBox(
                  width: responsiveData.isBetween400And600()? 50 : 220,
                  child: sideMenuWidget
                  ),
              )
            ),
    
            //Dash board
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    flex:1,
                    child: Column(
                      children: [
                        Expanded(
                        flex: 0,
                        child: SizedBox(
                          child: HeaderWidget(),
                          ),
                        ),
    
                        Expanded(
                          flex: 1,
                          child: HomeWidget(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],  
        ),
      )
    );
  }
}


