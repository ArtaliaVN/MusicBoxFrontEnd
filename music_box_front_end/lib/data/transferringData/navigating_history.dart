import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/medium_data.dart';

class NavigatingHistory {
  int historyId = -1;
  static int currentHistoryStep = -1;
  final Widget historyWidget;
  final MediumData mediumHistoryData;
  final int panelIndexAtThatMoment;

  NavigatingHistory(this.historyId, this.historyWidget, this.mediumHistoryData, this.panelIndexAtThatMoment);
}