import 'dart:collection';

import 'package:music_box_front_end/data/transferringData/medium_data.dart';

final class NavigatingHistory extends LinkedListEntry<NavigatingHistory>{
  final MediumData mediumHistoryData;
  final int panelIndexAtThatMoment;
  
  NavigatingHistory(this.mediumHistoryData, this.panelIndexAtThatMoment);
}