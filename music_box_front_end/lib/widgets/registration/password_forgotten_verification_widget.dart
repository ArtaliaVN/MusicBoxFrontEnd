import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/widgets/registration/textfield_widget.dart';

class PasswordForgottenVerificationWidget extends StatefulWidget{
  final TextfieldWidget emailField = TextfieldWidget(text: "Email",width: 300, hideText: false);
  final NavigatingSignal signal;
  PasswordForgottenVerificationWidget({super.key, required this.signal});
  
  @override
  State<PasswordForgottenVerificationWidget> createState() => VerificationState();
}

class VerificationState extends State<PasswordForgottenVerificationWidget>{
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: Colors.black38,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: BlurryContainer(
        blur: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                  child: Text(
                    "Enter your email",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          
              widget.emailField,
          
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0,10,0,0),
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black38,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: FloatingActionButton(
                        onPressed: () => {widget.signal.setNavSignal(0)},
                        backgroundColor: Colors.white,
                        child: const Text(
                          "Back",
                        ),
                      ),
                    ),
          
                    Container(
                      margin: EdgeInsets.fromLTRB(0,10,0,0),
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black38,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Colors.white,
                        child: const Text(
                          "Send",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}
