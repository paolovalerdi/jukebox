// To parse this JSON data, do
//
//     final artist = artistFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Artist artistFromJson(String str) => Artist.fromJson(json.decode(str));

String artistToJson(Artist data) => json.encode(data.toJson());

class Artist extends Equatable {
  const Artist({
    required this.name,
    required this.img,
    required this.tracks,
    required this.bio,
    required this.tags,
    required this.similar,
    required this.albums,
  });

  @override
  List<Object?> get props => [name];

  final String name;
  final String img;
  final List<Album> tracks;
  final String bio;
  final List<Tag> tags;
  final List<Similar> similar;
  final List<Album> albums;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        img: json["img"],
        name: json["name"],
        tracks: List<Album>.from(json["tracks"].map((x) => Album.fromJson(x))),
        bio: json["bio"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        similar:
            List<Similar>.from(json["similar"].map((x) => Similar.fromJson(x))),
        albums: List<Album>.from(json["albums"].map((x) => Album.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
        "bio": bio,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "similar": List<dynamic>.from(similar.map((x) => x.toJson())),
        "albums": List<dynamic>.from(albums.map((x) => x.toJson())),
      };
}

class Album {
  Album({
    required this.title,
    required this.playcount,
    required this.url,
    required this.img,
    required this.listeners,
  });

  final String title;
  final int? playcount;
  final String url;
  final String img;
  final int? listeners;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        title: json["title"],
        playcount: json["playcount"],
        url: json["url"],
        img: json["img"],
        listeners: json["listeners"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "playcount": playcount,
        "url": url,
        "img": img,
        "listeners": listeners,
      };
}

class Similar {
  Similar({
    required this.name,
    required this.img,
  });

  final String name;
  final String img;

  factory Similar.fromJson(Map<String, dynamic> json) => Similar(
        name: json["name"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
      };
}

class Tag {
  Tag({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
