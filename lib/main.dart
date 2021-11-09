import 'package:flutter/material.dart';
import 'package:jukebox/src/jukebox_scaffold.dart';
import 'package:jukebox/src/ui/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jukebox',
      theme: ThemeData.from(colorScheme: ColorScheme.dark()),
      home: Scaffold(
        body: const MainLayout(),
      ),
    );
  }
}
