import 'package:json_annotation/json_annotation.dart';

part 'saved_albums.g.dart';

@JsonSerializable()
class SavedAlbums {
  const SavedAlbums({
    required this.href,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory SavedAlbums.fromJson(Map<String, dynamic> json) =>
      _$SavedAlbumsFromJson(json);

  final String href;
  final int limit;
  final String? next;
  final int offset;
  final String? previous;
  final int total;
}
