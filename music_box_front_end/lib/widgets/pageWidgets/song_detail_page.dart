import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/mainWidgets/side_menu_widget.dart';
import 'package:music_box_front_end/widgets/searchPar/header_widget.dart';
import 'package:music_box_front_end/widgets/songInfo/song_detailed_page_widget.dart';

class SongDetailPage extends StatefulWidget{
  final SongDto songDto;
  const SongDetailPage({super.key, required this.songDto});

  @override
  State<SongDetailPage> createState() => SongDetailState();
}

class SongDetailState extends State<SongDetailPage>{

  @override
  Widget build(BuildContext context) {
    final ResponsiveData responsiveData = ResponsiveData(context: context);
    final SideMenuWidget sideMenuWidget = SideMenuWidget();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background1.jpg"),
            fit: BoxFit.cover,
            )
        ),
        child: responsiveData.isLessThan400()? 
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                  flex: 0,
                  child: SizedBox(
                    child: HeaderWidget(),
                    ),
                  ),
                  
                  Expanded(
                    flex: 1,
                    child: SongDetailedPageWidget(songDto: widget.songDto,)
                  ),
                ],
              ),
            ),
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
        )
        :
        Row(
          children: [
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
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                  flex: 0,
                  child: SizedBox(
                    child: HeaderWidget(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SongDetailedPageWidget(songDto: widget.songDto)
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}