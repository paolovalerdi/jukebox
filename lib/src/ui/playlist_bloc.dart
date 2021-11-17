import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jukebox/src/ui/playlist_store.dart';
import 'package:jukebox/src/ui/song.dart';

class PlaylistBloc extends Cubit<List<Song>> {
  PlaylistBloc(this._playlistStore) : super([]) {
    _playlistSubscription = _playlistStore.songs().listen(emit);
  }

  final PlaylistStore _playlistStore;
  late final StreamSubscription<List<Song>> _playlistSubscription;

  Future<void> delete(Song song) => _playlistStore.delete(song);

  @override
  Future<void> close() async {
    await _playlistSubscription.cancel();
    return super.close();
  }
}
