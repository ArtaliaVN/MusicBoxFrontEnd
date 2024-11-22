import 'package:flutter/material.dart';

import '../models/menu_model.dart';

class SideMenuData {
  final menu = const<MenuModel>[
    MenuModel(icon: Icons.home, title: "Home"),
    MenuModel(icon: Icons.search, title: "Search"),
    MenuModel(icon: Icons.my_library_music, title: "Library"),
    MenuModel(icon: Icons.settings, title: "Setting"),
  ];
}