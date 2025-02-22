import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/widgets/mainWidgets/side_menu_widget.dart';
import 'package:music_box_front_end/widgets/registration/sign_in_widget.dart';

class SignInPage extends StatefulWidget{
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => SignInState();
}

class SignInState extends State<SignInPage>{
  @override
  Widget build(BuildContext context) {
    final ResponsiveData responsiveData = ResponsiveData(context: context);
    final SideMenuWidget sideMenuWidget = SideMenuWidget();
    return Scaffold(
      floatingActionButton:Navigator.canPop(context)? FloatingActionButton(
        onPressed: (){ 
        Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ):null,
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
            Expanded(
              flex: 1,
              child: SignInWidget()
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
            Expanded(
              flex: 1,
              child: SignInWidget()
            ),
          ],
        )
      ),
    );
  }
}