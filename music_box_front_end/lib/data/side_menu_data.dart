import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/home_widget.dart';
import 'package:music_box_front_end/widgets/library_widget.dart';
import 'package:music_box_front_end/widgets/search_result_widget.dart';
import 'package:music_box_front_end/widgets/setting_widget.dart';

import '../models/menu_model.dart';

class SideMenuData {
  final menu = const<MenuModel>[
    MenuModel(icon: Icons.home, title: "Home", widget: HomeWidget()),
    MenuModel(icon: Icons.search, title: "Search", widget: SearchResultWidget()),
    MenuModel(icon: Icons.my_library_music, title: "Library",widget: LibraryWidget()),
    MenuModel(icon: Icons.settings, title: "Setting", widget: SettingWidget()),
  ];
}