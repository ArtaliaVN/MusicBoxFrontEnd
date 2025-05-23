import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/widgets/pageWidgets/password_forgotten_page.dart';
import 'package:music_box_front_end/widgets/pageWidgets/sign_up_page.dart';
import 'package:music_box_front_end/widgets/registration/textfield_widget.dart';

class SignInWidget extends StatefulWidget{
  final TextfieldWidget identityField = TextfieldWidget(text: "Email or username", width: 300, hideText: false);
  final TextfieldWidget passwordField = TextfieldWidget(text: "Password", width: 300, hideText: true);
  SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => SignInState();
}

class SignInState extends State<SignInWidget>{
  
  @override
  Widget build(BuildContext context){
    final ResponsiveData responsiveData = ResponsiveData(context: context);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,8),
                child: SizedBox(
                  width: 300,
                  // child: Text(
                  //   "Enter email or username",
                  //   style: TextStyle(color: Colors.white),
                  // ),
                ),
              ),

              widget.identityField,

              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,8),
                child: SizedBox(
                  width: 300,
                  // child: Text(
                  //   "Password",
                  //   style: TextStyle(color: Colors.white),
                  // ),
                ),
              ),

              widget.passwordField,

              Container(
                margin: EdgeInsets.fromLTRB(0,10,0,0),
                width: 300,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black38,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: FloatingActionButton(
                  onPressed: () => setState((){
                    print("Identity is ${widget.identityField.data} and password is ${widget.passwordField.data}");
                    },),
                  backgroundColor: Colors.white,
                  heroTag: 'Log1',
                  child: const Text(
                    "Log in",
                  ),
                ),
              ),

              TextButton(
                onPressed: () => setState((){
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PasswordForgottenPage()),
                      );
                }),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(color: Colors.white),
                  )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white),
                      ),
                  ),

                  TextButton(
                    onPressed: () => setState((){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    }) ,
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  } 
}