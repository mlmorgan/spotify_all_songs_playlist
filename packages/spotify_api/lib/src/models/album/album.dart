import 'package:json_annotation/json_annotation.dart';

import '../tracks/tracks.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  const Album({required this.tracks});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  final Tracks tracks;
}
