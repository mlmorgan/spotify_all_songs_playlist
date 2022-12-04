import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import '../album_item/album_item.dart';

part 'saved_albums.g.dart';

@JsonSerializable()
class SavedAlbums extends Equatable {
  const SavedAlbums({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory SavedAlbums.fromJson(Map<String, dynamic> json) =>
      _$SavedAlbumsFromJson(json);

  final String href;
  final List<AlbumItem> items;
  final int limit;
  final String? next;
  final int offset;
  final String? previous;
  final int total;

  @override
  List<Object?> get props => [
        href,
        items,
        limit,
        next,
        offset,
        previous,
        total,
      ];
}
