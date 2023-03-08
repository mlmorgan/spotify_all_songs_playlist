import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist extends Equatable {
  const Playlist({
    required this.id,
    required this.name,
  });

  static Playlist fromJsonModel(Object? json) =>
      Playlist.fromJson(json as Map<String, dynamic>);

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  final String id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
