import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/my_home_page.dart';
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color.fromARGB(20, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListenableBuilder(
        listenable: signal,
        builder: (BuildContext context, Widget? child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 260, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.85),
            scrollDirection: Axis.vertical,
            itemCount: result.result.length,
            itemBuilder: (context, index) {
              return GridTile(child: buildSearchItem(result, index));
              }
            ); 
        },
      )
    );
  }

  Widget buildSearchItem(SongData result, int index){
    IconData icon = Icons.play_arrow;

    return InkWell(
      onTap: () => setState((){
              selectedIndex = index;
              signal.setIndex(index);
              signal.setSong(result.result[signal.getIndex]);
              signal.toggleSignal(true);   
              },
            ),
      borderRadius: BorderRadius.circular(15),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromARGB(170, 9, 31, 16),
            border: Border.all(
              color: Colors.black12,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.result[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Artist: ${result.result[index].artist} ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),

              Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => setState((){
                    selectedIndex = index;
                    }
                  ), 
                  child: 
                    Icon(
                      Icons.play_arrow,
                      size: 80, 
                      color: Colors.greenAccent
                    ),
                ),
              )
            ],
          )
        ),
    );
  }

}