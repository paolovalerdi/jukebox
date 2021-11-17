import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jukebox/src/ui/artist_bloc.dart';
import 'package:jukebox/src/ui/content_panel.dart';
import 'package:jukebox/src/ui/play_list.dart';
import 'package:jukebox/src/ui/playlist_panel.dart';
import 'package:jukebox/src/ui/playlist_store.dart';
import 'package:jukebox/src/ui/search_column.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late ArtistPageBloc _bloc;

  @override
  void initState() {
    _bloc = ArtistPageBloc(context.read<PlaylistStore>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistPageBloc, ArtistPageState>(
        bloc: _bloc,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Expanded(
                flex: 2,
                child: Card(
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: SearchColumn(
                    onTextChange: _bloc.onArtistNameChange,
                    artist: state.artist,
                    loading: state.loading,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 48,
                    horizontal: 16,
                  ),
                  child: ContentPanel(
                    artist: state.artist,
                    loading: state.loading,
                    onAddToPlaylist: (album) => _bloc.addSongToPlaylist(album),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 48,
                    horizontal: 10,
                  ),
                  child: const PlaylistPanel(),
                ),
              ),
              const Spacer(),
            ],
          );
        });
  }
}
