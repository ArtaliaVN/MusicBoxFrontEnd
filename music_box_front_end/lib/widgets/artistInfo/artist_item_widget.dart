import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/widgets/pageWidgets/artist_detail_page.dart';

class ArtistItemWidget extends StatefulWidget{
  final int index;
  final ArtistDto artist;
  ArtistItemWidget({super.key, required this.index, required this.artist});

  @override
  State<ArtistItemWidget> createState() => ArtistItemWidgetState();
}

class ArtistItemWidgetState extends State<ArtistItemWidget>{
  late NetworkImage artistItemImage;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    artistItemImage = NetworkImage("http://localhost:8080/user/image/id=${widget.artist.id}/account");
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => setState((){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArtistDetailPage(artistDto: widget.artist,)),
              );
              },
            ),
      child: Column(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: artistItemImage,
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black12,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
          ),

          Expanded(
            flex: 0,
            child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Artist: ${widget.artist.userName}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
          )
        ],
      ),
    );
  }
} 