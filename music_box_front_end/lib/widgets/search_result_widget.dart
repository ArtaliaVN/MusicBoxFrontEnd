import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/my_home_page.dart';
import 'package:music_box_front_end/widgets/song_item_widget.dart';
import '../data/song_data.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => SearchResultState();
}

class SearchResultState extends State<SearchResultWidget>{
  int selectedIndex = 0;
  final NavigatingSignal signal = HomeScreenState.navigatingSignal;
  @override
  Widget build(BuildContext context) {
    final result = SongData();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black38,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: BlurryContainer(
        blur: 5,
        child: ListenableBuilder(
          listenable: signal,
          builder: (BuildContext context, Widget? child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 260, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.85),
              scrollDirection: Axis.vertical,
              itemCount: result.result.length,
              itemBuilder: (context, index) {
                  return GridTile(child: SongItemWidget(result: result, index: index,));
                }
              ); 
          },
        ),
      ),
    );
  }
}