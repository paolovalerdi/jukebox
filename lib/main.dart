import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

import 'package:jukebox/src/ui/main_layout.dart';
import 'package:jukebox/src/ui/playlist_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await databaseFactoryWeb.openDatabase("jukebox");
  runApp(MyApp(database: db));
}

class MyApp extends StatelessWidget {
  final Database database;

  const MyApp({
    Key? key,
    required this.database,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PlaylistStore>.value(
      value: PlaylistStore(database),
      child: MaterialApp(
        title: 'Jukebox',
        theme: ThemeData.from(colorScheme: const ColorScheme.dark()),
        home: const Scaffold(body: MainLayout()),
      ),
    );
  }
}
