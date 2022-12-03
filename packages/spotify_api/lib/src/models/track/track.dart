import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  const Track({
    required this.name,
    required this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  final String name;
  final String uri;
}
