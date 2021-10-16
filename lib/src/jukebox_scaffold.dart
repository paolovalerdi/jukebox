import 'package:flutter/material.dart';
import 'package:jukebox/src/artist_bio.dart';
import 'package:jukebox/src/auth_dialog.dart';
import 'package:jukebox/src/home_search.dart';
import 'package:jukebox/src/playlist.dart';
import 'package:jukebox/src/register_dialog.dart';
import 'package:jukebox/src/search_result.dart';

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
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(context: context, builder: (_) => RegisterDialog());
              },
              child: Text('Registrarse'))
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: SizedBox()),
          Column(children: <Widget>[
            SizedBox(
              width: 800,
              child: HomeSearch(),
            ),
            SizedBox(
              width: 800,
              height: 700,
              child: ListView.builder(
                  itemCount: _canciones.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            title: Text(_canciones[index].name +
                                ' ' +
                                _canciones[index].nameAlbum +
                                ' ' +
                                _canciones[index].nameArtist +
                                ' ' +
                                _canciones[index].year),
                            leading: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('Images/vinylwhite512.png')),
                            trailing: Stack(
                              children: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ArtistBio(),
                                      ));
                                    },
                                    child: Text('Ir')),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Playlist(),
                                    ));
                                  },
                                  child: Text('Agregar a lista'),
                                )
                              ],
                            )));
                  }),
            )
          ]),
          Expanded(child: SizedBox()),
          //Expanded(child: SearchResult())
        ],
      ),
    );
  }
}

//canciones
class Cancion {
  String name = "";
  String nameArtist = "";
  String year = "";
  String nameAlbum = "";

  Cancion(this.name, this.nameArtist, this.year, this.nameAlbum);
}

List<Cancion> _canciones = [
  Cancion("Don't Start Now", "Dua Lipa", "2020", "Future Nostalgia"),
  Cancion("Watermelon Sugar", "Harry Styles", "2019", "Line Fine"),
  Cancion(
      "I Fell It Comming (con Daft Punk)", "The Weekend", "2016", "Starboy"),
  Cancion("This Girl", "Kungs", "2016", "Layers"),
  Cancion("Summer", "Calvin Harris", "2014", "Motion"),
  Cancion("Something Just Like This", "The Chainsmokers and Coldplay", "2017",
      "Somethin Just Like This")
];
