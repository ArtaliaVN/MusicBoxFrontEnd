import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/mainWidgets/dash_board_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/side_menu_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => HomeScreenState();
}

class HomeScreenState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background1.jpg"),
          fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
              //Left tools par
              Expanded(
                flex:0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: SizedBox(
                    width: 150,
                    child: SideMenuWidget()
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
                      child: DashBoardWidget(),
                    ),
                  ],
                ),
              )
            ],  
          ),
        )
      )
    );
  }
}


