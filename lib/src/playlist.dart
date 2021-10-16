import 'package:flutter/material.dart';
import 'song_model.dart' show Song;

class Playlist extends StatelessWidget {
  List<Song> _songs = [
    Song("Don't Start Now", "Dua Lipa", "2020", "Future Nostalgia"),
    Song("Watermelon Sugar", "Harry Styles", "2019", "Line Fine"),
    Song("I Fell It Comming (con Daft Punk)", "The Weekend", "2016", "Starboy"),
    Song("This Girl", "Kungs", "2016", "Layers"),
    Song("Summer", "Calvin Harris", "2014", "Motion"),
    Song("Something Just Like This", "The Chainsmokers and Coldplay", "2017",
        "Something Just Like This")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _songs.length,
      itemBuilder: (context, index) {
        return Material(
          child: ListTile(
            title: Text(_songs[index].name +
                ' ' +
                _songs[index].nameAlbum +
                ' ' +
                _songs[index].nameArtist +
                ' ' +
                _songs[index].year),
          ),
        );
      },
    );
  }
}
