import 'package:flutter/material.dart';
import 'package:jukebox/src/artist.dart';

class SearchColumn extends StatelessWidget {
  final ValueChanged<String>? onTextChange;
  final Artist? artist;
  final bool loading;

  const SearchColumn({
    Key? key,
    this.onTextChange,
    this.artist,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      child: Column(
        children: [
          _searchBox(),
          _spacer(size: 24),
          if (loading) const LinearProgressIndicator(),
          if (artist != null) ...[
            _spacer(size: 24),
            _image(),
            _spacer(size: 24),
            Text(
              artist!.name,
              style: textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            _spacer(size: 24),
            Text(
              artist!.bio,
              style: textTheme.bodyText2?.copyWith(
                color: Color(0xCCFFFFFF),
              ),
            )
          ]
        ],
      ),
    );
  }

  Widget _image() {
    return LayoutBuilder(
      builder: (_, constraints) {
        final size = constraints.maxWidth * .65;
        return ClipOval(
          child: Image.network(
            artist!.img,
            fit: BoxFit.cover,
            width: size,
            height: size,
          ),
        );
      },
    );
  }

  Widget _searchBox() {
    return TextField(
      onChanged: onTextChange,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Nombre del artista",
      ),
    );
  }

  Widget _spacer({double size = 16}) => SizedBox(height: size);
}
