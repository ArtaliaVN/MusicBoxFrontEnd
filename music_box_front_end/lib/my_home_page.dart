import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/models/panel_model.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_detail_page_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/dash_board_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/home_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/library_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/search_result_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/setting_widget.dart';
import 'package:music_box_front_end/widgets/mainWidgets/side_menu_widget.dart';
import 'package:music_box_front_end/widgets/registration/password_forgotten_verification_widget.dart';
import 'package:music_box_front_end/widgets/registration/personal_profile_widget.dart';
import 'package:music_box_front_end/widgets/registration/sign_in_widget.dart';
import 'package:music_box_front_end/widgets/registration/sign_up_widget.dart';
import 'package:music_box_front_end/widgets/songInfo/music_provider.dart';
import 'package:music_box_front_end/widgets/songInfo/song_detailed_page_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  
  final NavigatingSignal navigatingSignal = NavigatingSignal();
  
  @override
  Widget build(BuildContext context){
    final MusicProvider musicProvider = MusicProvider();
    final HomeWidget homePage = HomeWidget(navigatingSignal: navigatingSignal);
    final SearchResultWidget searchResultPage = SearchResultWidget(navigatingSignal: navigatingSignal);
    final LibraryWidget libraryPage = LibraryWidget();
    final SettingWidget settingPage = SettingWidget();
    final SongDetailedPageWidget songDetailPage = SongDetailedPageWidget(navigatingSignal: navigatingSignal, musicProvider: musicProvider);
    final ArtistDetailedPageWidget artistDetailPage = ArtistDetailedPageWidget(navigatingSignal: navigatingSignal);
    final SignInWidget signInWidget = SignInWidget(signal: navigatingSignal);
    final SignUpWidget  signUpWidget  = SignUpWidget(signal: navigatingSignal);
    final PasswordForgottenVerificationWidget passwordForgottenVerificationWidget = PasswordForgottenVerificationWidget(signal: navigatingSignal);
    final PersonalProfileWidget personalProfileWidget = PersonalProfileWidget();
    final ResponsiveData responsiveData = ResponsiveData(context: context);
    final menu = <PanelModel>[
      PanelModel(icon: Icons.home, title: "Home", widget: homePage),
      PanelModel(icon: Icons.search, title: "Search", widget: searchResultPage),
      PanelModel(icon: Icons.my_library_music, title: "Library",widget: libraryPage),
      PanelModel(icon: Icons.settings, title: "Setting", widget: settingPage),
      PanelModel(icon: Icons.person, title: "Sign in", widget: signInWidget),
      PanelModel(icon: Icons.person, title: "SongDetailPage", widget: songDetailPage),
      PanelModel(icon: Icons.signal_cellular_null_sharp, title: "ArtistDetailPage", widget: artistDetailPage),
      PanelModel(icon: Icons.signal_cellular_null_sharp, title: "SignUpPage", widget: signUpWidget),
      PanelModel(icon: Icons.signal_cellular_null_sharp, title: "PasswordForgottenVerificationPage", widget: passwordForgottenVerificationWidget),
      PanelModel(icon: Icons.signal_cellular_null_sharp, title: "PersonalProfilePage", widget: personalProfileWidget),
    ];
    final DashBoardWidget dashBoardWidget = DashBoardWidget(navigatingSignal: navigatingSignal, menu: menu);
    final SideMenuWidget sideMenuWidget = SideMenuWidget(navigatingSignal: navigatingSignal, menu: menu);
    
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
          child: responsiveData.isLessThan400()? 
          Column(
            children: [
              //Dash board
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex:1,
                      child: dashBoardWidget,
                      ),
                    ],
                  ),
                ),
                //Left tools par
              Expanded(
                flex:0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: SizedBox(
                    width: responsiveData.isBetween400And600()? 50 : 220,
                    child: sideMenuWidget
                    ),
                )
              ),
            ],  
          ):
          
          Row(
            children: [
              //Left tools par
              Expanded(
                flex:0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: SizedBox(
                    width: responsiveData.isBetween400And600()? 50 : 220,
                    child: sideMenuWidget
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
                      child: dashBoardWidget
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


