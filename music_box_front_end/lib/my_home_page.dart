import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/models/panel_model.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_detail_page_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/dash_board_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/home_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/library_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/registration_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/search_result_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/setting_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/side_menu_widget.dart';
import 'package:music_box_front_end/widgets/songInfo/music_provider.dart';
import 'package:music_box_front_end/widgets/songInfo/song_detailed_page_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => HomeScreenState();
}

class HomeScreenState extends State<MyHomePage> {
  final NavigatingSignal navigatingSignal = NavigatingSignal();
  
  @override
  Widget build(BuildContext context){
    final MusicProvider musicProvider = MusicProvider();

    final HomeWidget homePage = HomeWidget(navigatingSignal: navigatingSignal);
    final SearchResultWidget searchResultPage = SearchResultWidget(navigatingSignal: navigatingSignal);
    final LibraryWidget libraryPage = LibraryWidget();
    final SettingWidget settingPage = SettingWidget();
    final RegistrationWidget registrationPage = RegistrationWidget(); 
    final SongDetailedPageWidget songDetailPage = SongDetailedPageWidget(navigatingSignal: navigatingSignal, musicProvider: musicProvider);
    final ArtistDetailedPageWidget artistDetailPage = ArtistDetailedPageWidget(navigatingSignal: navigatingSignal);
    
     final menu = <PanelModel>[
      PanelModel(icon: Icons.home, title: "Home", widget: homePage),
      PanelModel(icon: Icons.search, title: "Search", widget: searchResultPage),
      PanelModel(icon: Icons.my_library_music, title: "Library",widget: libraryPage),
      PanelModel(icon: Icons.settings, title: "Setting", widget: settingPage),
      PanelModel(icon: Icons.person, title: "Registration", widget: registrationPage),
      PanelModel(icon: Icons.signal_cellular_null_sharp, title: "SongDetailPage", widget: songDetailPage),
      PanelModel(icon: Icons.signal_cellular_null_sharp, title: "ArtistDetailPage", widget: artistDetailPage),
    ];

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background1.jpg"),
          fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
              //Left tools par
              Expanded(
                flex:0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: SizedBox(
                    width: 150,
                    child: SideMenuWidget(navigatingSignal: navigatingSignal, menu: menu,)
                    ),
                )
              ),

              //Dash board
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex:1,
                      child: DashBoardWidget(navigatingSignal: navigatingSignal, menu: menu,),
                    ),
                  ],
                ),
              )
            ],  
          ),
        )
      )
    );
  }
}


