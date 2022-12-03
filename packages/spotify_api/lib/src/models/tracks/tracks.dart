import 'package:json_annotation/json_annotation.dart';

import '../track/track.dart';

part 'tracks.g.dart';

@JsonSerializable()
class Tracks {
  const Tracks({
    required this.items,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);

  final List<Track> items;
}
