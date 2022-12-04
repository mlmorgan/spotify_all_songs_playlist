import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'track.g.dart';

@JsonSerializable()
class Track extends Equatable {
  const Track({
    required this.name,
    required this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  final String name;
  final String uri;

  @override
  List<Object?> get props => [name, uri];
}
