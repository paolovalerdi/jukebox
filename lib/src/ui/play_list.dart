import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../artist.dart';

class PlayList extends StatelessWidget {
  final Artist? artist;
  final bool loading;
  const PlayList({
    Key? key,
    this.artist,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    //throw UnimplementedError();
    return artist == null
        ? const SizedBox()
        : CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _title("Canciones", context),
              _buildTags(),
            ],
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

  Widget _buildTags() {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        children: artist!.tags.map((e) => Chip(label: Text(e.name))).toList(),
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
    // TODO: implement build
    throw UnimplementedError();
  }
}
