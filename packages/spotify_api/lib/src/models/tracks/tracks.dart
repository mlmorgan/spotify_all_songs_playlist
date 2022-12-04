import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import '../track/track.dart';

part 'tracks.g.dart';

@JsonSerializable()
class Tracks extends Equatable {
  const Tracks({
    required this.items,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);

  final List<Track> items;

  @override
  List<Object?> get props => [items];
}
