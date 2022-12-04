import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist extends Equatable {
  const Playlist({
    required this.id,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  final String id;

  @override
  List<Object?> get props => [id];
}
