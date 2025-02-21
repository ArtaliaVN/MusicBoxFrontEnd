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
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: SizedBox(
            width: 300,
            height: 300,
            child: ListView(
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
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0,10,5,0),
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.black38,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: FloatingActionButton(
                            onPressed: () => {widget.signal.setNavSignal(4)},
                            backgroundColor: Colors.white,
                            child: const Text(
                              "Back",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5,10,0,0),
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
                      ),
                    ],
                  )
                ),
              ]
            ),
          ),
        )
      )
    );
  }
}
