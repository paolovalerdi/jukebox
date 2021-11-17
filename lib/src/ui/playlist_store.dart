import 'package:jukebox/src/ui/song.dart';
import 'package:sembast/sembast.dart';

class PlaylistStore {
  final _store = intMapStoreFactory.store("playlist_store");
  final Database _database;

  PlaylistStore(this._database);

  Future<void> insert(Song song) async {
    await _store.add(_database, song.toMap());
  }

  Stream<List<Song>> songs() {
    return _store.query().onSnapshots(_database).map(
          (records) => records
              .map(
                (it) => Song.fromMap(it.value),
              )
              .toList(),
        );
  }

  Future<void> delete(Song song) async {
    await _store.delete(
      _database,
      finder: Finder(
        filter: Filter.equals("url", song.url),
        limit: 1,
      ),
    );
  }
}
