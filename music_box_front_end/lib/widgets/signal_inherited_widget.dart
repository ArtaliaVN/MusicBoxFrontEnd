import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';

class SignalInheritedWidget extends InheritedWidget{
  final NavigatingSignal navigatingSignal;

  const SignalInheritedWidget({
    super.key,
    required this.navigatingSignal, 
    required super.child,
  });

  static SignalInheritedWidget? maybeOf(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<SignalInheritedWidget>();
  }

  static SignalInheritedWidget of(BuildContext context) {
    final SignalInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  bool updateShouldNotify(SignalInheritedWidget oldWidget) => navigatingSignal != oldWidget.navigatingSignal;
}