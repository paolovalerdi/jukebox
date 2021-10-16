import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class SearchResult extends StatelessWidget {
  SearchResult({Key? key}) : super(key: key);

  List<Cancion> _canciones = [
    Cancion("Don't Start Now", "Dua Lipa", "2020", "Future Nostalgia"),
    Cancion("Watermelon Sugar", "Harry Styles", "2019", "Line Fine"),
    Cancion(
        "I Fell It Comming (con Daft Punk)", "The Weekend", "2016", "Starboy"),
    Cancion("This Girl", "Kungs", "2016", "Layers"),
    Cancion("Summer", "Calvin Harris", "2014", "Motion"),
    Cancion("Something Just Like This", "The Chainsmokers and Coldplay", "2017",
        "Something Just Like This")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _canciones.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(_canciones[index].name +
                  ' ' +
                  _canciones[index].nameAlbum +
                  ' ' +
                  _canciones[index].nameArtist +
                  ' ' +
                  _canciones[index].year));
        });
  }
}

class Cancion {
  String name = "";
  String nameArtist = "";
  String year = "";
  String nameAlbum = "";

  Cancion(this.name, this.nameArtist, this.year, this.nameAlbum);
}
