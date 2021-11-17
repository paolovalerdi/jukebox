import 'package:equatable/equatable.dart';

class Song extends Equatable {
  final String title;
  final String artist;
  final String url;
  final String img;

  Song({
    required this.title,
    required this.artist,
    required this.url,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'artist': artist,
      'url': url,
      'img': img,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      title: map['title'],
      artist: map['artist'],
      url: map['url'],
      img: map['img'],
    );
  }

  @override
  List<Object?> get props => [title, artist, url, img];
}
