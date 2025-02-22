import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/artist_sending_dto.dart';
import 'package:music_box_front_end/service/remote_service.dart';
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

  SignUpWidget({super.key});

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
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: SizedBox(
            width: 300,
            height: 450,
            child: ListView(
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
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,5,0),
                        child: SizedBox(
                          height: 75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 5, 8),
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
                      ),
                    ),
                          
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,0,0),
                        child: SizedBox(
                          height: 75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 0, 8),
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
                        ),
                      ),
                    )
                  ],
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
                            onPressed: () => setState(() {Navigator.pop(context);}) ,
                            backgroundColor: Colors.white,
                            heroTag: 'back',
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
                            onPressed: () => setState(() {
                              widget.dto.email = widget.emailField.data;
                              widget.dto.userName = widget.usernameField.data;
                              widget.dto.firstName = widget.firstnameField.data;
                              widget.dto.lastName = widget.lastnameField.data;
                              widget.dto.password = widget.passwordField.data;
                              widget.service.postArtist(widget.dto);
                            },),
                            backgroundColor: Colors.white,
                            heroTag: 'Create',
                            child: const Text(
                              "Create",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}