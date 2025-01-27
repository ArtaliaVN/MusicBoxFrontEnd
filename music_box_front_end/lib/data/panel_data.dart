import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_detail_page_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/home_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/library_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/search_result_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/setting_widget.dart';
import 'package:music_box_front_end/widgets/songInfo/song_detailed_page_widget.dart';

import '../models/panel_model.dart';

class PanelData {

  final menu = <PanelModel>[
    const PanelModel(icon: Icons.home, title: "Home", widget: HomeWidget()),
    const PanelModel(icon: Icons.search, title: "Search", widget: SearchResultWidget()),
    const PanelModel(icon: Icons.my_library_music, title: "Library",widget: LibraryWidget()),
    const PanelModel(icon: Icons.settings, title: "Setting", widget: SettingWidget()),
    PanelModel(icon: Icons.signal_cellular_null_sharp, title: "SongDetailPage", widget: SongDetailedPageWidget()),
    PanelModel(icon: Icons.signal_cellular_null_sharp, title: "ArtistDetailPage", widget: ArtistDetailedPageWidget()),
  ];
}