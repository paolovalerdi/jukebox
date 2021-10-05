import 'package:flutter/material.dart';
import 'package:jukebox/src/auth_dialog.dart';
import 'package:jukebox/src/home_search.dart';

class JukeBoxScaffold extends StatelessWidget {
  const JukeBoxScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Jukebox"),
        centerTitle: true,
        actions: [
          ElevatedButton(
            child: const Text("Iniciar sesión"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const AuthDialog(),
              );
            },
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(child: SizedBox()),
          SizedBox(
            width: 800,
            child: HomeSearch(),
          ),
          Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
