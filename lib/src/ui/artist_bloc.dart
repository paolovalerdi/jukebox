import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jukebox/src/ui/playlist_store.dart';
import 'package:jukebox/src/ui/song.dart';
import 'package:rxdart/rxdart.dart';

import 'package:jukebox/src/artist.dart';

class ArtistPageState {
  final bool loading;
  final Artist? artist;
  final Exception? exception;

  const ArtistPageState({
    this.artist,
    this.exception,
    this.loading = false,
  });

  ArtistPageState copyWith({
    bool? loading,
    Artist? artist,
    Exception? exception,
  }) {
    return ArtistPageState(
      loading: loading ?? this.loading,
      artist: artist ?? this.artist,
      exception: exception ?? this.exception,
    );
  }
}

class ArtistPageBloc extends Cubit<ArtistPageState> {
  ArtistPageBloc(this._playlistStore) : super(const ArtistPageState()) {
    _artistNameStream = BehaviorSubject.seeded("");
    _subscription = _artistNameStream
        .debounceTime(
          const Duration(milliseconds: 500),
        )
        .where((event) => event.isNotEmpty)
        .listen(_fetch);
  }

  final PlaylistStore _playlistStore;
  late BehaviorSubject<String> _artistNameStream;
  late StreamSubscription<String> _subscription;

  void onArtistNameChange(String name) {
    _artistNameStream.add(name);
  }

  void _fetch(String name) async {
    try {
      emit(state.copyWith(loading: true));
      final request = await http.post(
        Uri.parse("http://localhost:3000/artist"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name}),
      );
      final artist = Artist.fromJson(jsonDecode(request.body));
      emit(state.copyWith(artist: artist, loading: false));
    } on Exception catch (it) {
      emit(state.copyWith(exception: it));
    }
  }

  Future<void> addSongToPlaylist(Album album) async {
    _playlistStore.insert(
      Song(
        title: album.title,
        artist: state.artist?.name ?? "",
        url: album.url,
        img: album.img,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _artistNameStream.close();
    await _subscription.cancel();
    return super.close();
  }
}
