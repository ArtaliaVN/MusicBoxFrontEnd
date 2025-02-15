import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/widgets/registration/sign_up_widget.dart';
import 'package:music_box_front_end/widgets/registration/sign_in_widget.dart';
import 'package:music_box_front_end/widgets/registration/password_forgotten_verification_widget.dart';

class RegistrationWidget extends StatefulWidget{
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => RegistrationState();
}

class RegistrationState extends State<RegistrationWidget>{
  @override
  Widget build(BuildContext context) {
    NavigatingSignal signal = NavigatingSignal();
    var signInWidget = SignInWidget(signal:signal);
    var signUpWidget = SignUpWidget(signal:signal);
    var verificationWidget = PasswordForgottenVerificationWidget(signal:signal);
    List widgetList = <Widget>[signInWidget, signUpWidget, verificationWidget];

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ListenableBuilder(
            listenable: signal,
            builder: (BuildContext context, Widget? child) {
              return widgetList[signal.getNavSignal];
            },
          ),
        ),
      ],
    );
  }
}