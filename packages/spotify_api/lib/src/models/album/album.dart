import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import '../tracks/tracks.dart';

part 'album.g.dart';

@JsonSerializable()
class Album extends Equatable {
  const Album({required this.tracks});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  final Tracks tracks;

  @override
  List<Object?> get props => [tracks];
}
