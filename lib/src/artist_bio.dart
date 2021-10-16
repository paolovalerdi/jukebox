import 'package:flutter/material.dart';

class ArtistBio extends StatelessWidget {
  ArtistBio({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('"Nombre del artista"', textAlign: TextAlign.start),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Nombre:', textAlign: TextAlign.left),
            Text('Lugar de Nacimiento:', textAlign: TextAlign.left),
            Text('Año de nacimiento:', textAlign: TextAlign.left),
            Text('Reseña', textAlign: TextAlign.left)
          ],
        ),
      ),
    );
  }
}
