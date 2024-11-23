import 'package:flutter/material.dart';
import '../data/search_result_data.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => SearchResultState();
}

class SearchResultState extends State<SearchResultWidget>{
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final result = SearchResultData();

    return DecoratedBox(
      decoration: BoxDecoration(
        //color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.85),
      scrollDirection: Axis.vertical,
      itemCount: result.result.length,
      itemBuilder: (context, index) => buildSearchItem(result, index)
      ),
    );
  }

  Widget buildSearchItem(SearchResultData result, int index){
    IconData icon = Icons.play_arrow;
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => setState((){
              selectedIndex = index;
              }
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