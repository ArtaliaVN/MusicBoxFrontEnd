import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/home_widget.dart';
import 'package:music_box_front_end/widgets/library_widget.dart';
import 'package:music_box_front_end/widgets/search_result_widget.dart';
import 'package:music_box_front_end/widgets/setting_widget.dart';

import '../models/panel_model.dart';

class PanelData {

  final menu = <PanelModel>[
    const PanelModel(icon: Icons.home, title: "Home", widget: HomeWidget()),
    const PanelModel(icon: Icons.search, title: "Search", widget: SearchResultWidget()),
    const PanelModel(icon: Icons.my_library_music, title: "Library",widget: LibraryWidget()),
    const PanelModel(icon: Icons.settings, title: "Setting", widget: SettingWidget()),
  ];
}