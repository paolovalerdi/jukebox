import 'package:flutter/material.dart';
import 'package:jukebox/src/song_model.dart';

class ArtistPage extends StatelessWidget {
  List<Song> _songs = List.filled(
    20,
    Song("Don't Start Now", "Dua Lipa", "2020", "Future Nostalgia"),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            width: 200,
            height: 200,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text("A"),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 5,
          children: List.filled(4, Album()),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            _songs
                .map(
                  (e) => ListTile(
                    title: Text(e.name +
                        ' ' +
                        e.nameAlbum +
                        ' ' +
                        e.nameArtist +
                        ' ' +
                        e.year),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

class Album extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
    );
  }
}
