import 'package:flutter/material.dart';
import 'package:jukebox/src/ui/playlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jukebox/src/ui/playlist_store.dart';
import 'package:jukebox/src/ui/song.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlaylistPanel extends StatefulWidget {
  const PlaylistPanel({Key? key}) : super(key: key);

  @override
  State<PlaylistPanel> createState() => _PlaylistPanelState();
}

class _PlaylistPanelState extends State<PlaylistPanel> {
  late PlaylistBloc _bloc;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _bloc = PlaylistBloc(context.read<PlaylistStore>());
    _controller = YoutubePlayerController(initialVideoId: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, List<Song>>(
      bloc: _bloc,
      builder: (context, songs) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(song.img),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () => {
                          _controller.load(
                            YoutubePlayerController.convertUrlToId(song.url) ??
                                song.url,
                          ),
                          _controller.play()
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _bloc.delete(song),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          YoutubePlayerIFrame(
            controller: _controller,
            aspectRatio: 16 / 9,
          )
        ],
      ),
    );
  }
}
