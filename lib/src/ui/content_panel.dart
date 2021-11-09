import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../artist.dart';

class ContentPanel extends StatelessWidget {
  final Artist? artist;
  final bool loading;

  const ContentPanel({
    Key? key,
    this.artist,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    return artist == null
        ? const SizedBox()
        : CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _title("Géneros", context),
              _buildTags(),
              _title("Canciones más escuchadas", context),
              _buildSongs(),
              _title("Albumes más escuchados", context),
              _buildAlbums(),
            ],
          );
  }

  Widget _buildTags() {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        children: artist!.tags.map((e) => Chip(label: Text(e.name))).toList(),
      ),
    );
  }

  Widget _buildSongs() {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: artist!.tracks
            .map(
              (e) => AlbumWidget(
                title: e.title,
                img: e.img,
                listens: e.listeners ?? e.playcount ?? 0,
                url: e.url,
                playable: true,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildAlbums() {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: artist!.albums
            .map(
              (e) => AlbumWidget(
                title: e.title,
                img: e.img,
                listens: e.listeners ?? e.playcount ?? 0,
                url: e.url,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _title(String text, BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class AlbumWidget extends StatelessWidget {
  final String title;
  final int listens;
  final String img;
  final bool playable;
  final String url;

  const AlbumWidget({
    Key? key,
    required this.title,
    required this.listens,
    required this.img,
    required this.url,
    this.playable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: playable ? () => launch(url) : null,
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 4),
            Text(
              "$listens reproducciones",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
