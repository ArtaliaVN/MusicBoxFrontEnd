import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/artist_sending_dto.dart';
import 'package:music_box_front_end/service/remote_service.dart';
import 'package:music_box_front_end/widgets/registration/regis_nav_signal.dart';
import 'package:music_box_front_end/widgets/registration/textfield_widget.dart';

class SignUpWidget extends StatefulWidget{
  final emailField = TextfieldWidget(text: "Email", width: 300, hideText: false);
  final usernameField = TextfieldWidget(text: "Username", width: 300, hideText: false);
  final firstnameField = TextfieldWidget(text: "First name", width: 140, hideText: false); 
  final lastnameField = TextfieldWidget(text: "Last name", width: 140, hideText: false); 
  final passwordField = TextfieldWidget(text: "Password", width: 300, hideText: true);
  final passwordConfirmField = TextfieldWidget(text: "Confirm password", width: 300, hideText: true);
  final dto = ArtistSendingDto();
  final service = RemoteService();
  RegisNavSignal signal = RegisNavSignal();

  SignUpWidget({super.key, required this.signal});

  @override
  State<SignUpWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpWidget>{

  @override
  Widget build(BuildContext context){
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
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: 
                SizedBox(
                  width: 300,
                  child: Text(
                    "Your email",
                    style: TextStyle(
                        color: Colors.white,
                  
                      ),
                    ),
                ),
                ),
          
              widget.emailField,

              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: 
                SizedBox(
                  width: 300,
                  child: Text(
                    "Your username",
                    style: TextStyle(
                        color: Colors.white,
                  
                      ),
                    ),
                ),
                ),
          
              widget.usernameField,
          
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 75,
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                            child: 
                            SizedBox(
                              width: 300,
                              child: Text(
                                "Your first name",
                                style: TextStyle(
                                    color: Colors.white,
                              
                                  ),
                                ),
                            ),
                            ),
                    
                          widget.firstnameField,
                        ],
                      ),
                    ),
                          
                    SizedBox(
                      height: 75,
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                            child: 
                            SizedBox(
                              width: 300,
                              child: Text(
                                "Your last name",
                                style: TextStyle(
                                    color: Colors.white,
                              
                                  ),
                                ),
                            ),
                            ),
                    
                          widget.lastnameField,
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: SizedBox(
                  width: 300,
                  child: Text(
                    "Password",
                    style: TextStyle(
                        color: Colors.white,
                  
                      ),
                    ),
                ),
                ),
        
              widget.passwordField,

              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: SizedBox(
                  width: 300,
                  child: Text(
                    "Confirm password",
                    style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                ),
                ),
        
              widget.passwordConfirmField,

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
                        onPressed: () => {
                          widget.dto.email = widget.emailField.data,
                          widget.dto.userName = widget.usernameField.data,
                          widget.dto.firstName = widget.firstnameField.data,
                          widget.dto.lastName = widget.lastnameField.data,
                          widget.dto.password = widget.passwordField.data,
                          widget.service.postArtist(widget.dto),
                        }, 
                        backgroundColor: Colors.white,
                        child: const Text(
                          "Create",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        )
      );
  }
}