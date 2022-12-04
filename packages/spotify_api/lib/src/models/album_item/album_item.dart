import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import '../album/album.dart';

part 'album_item.g.dart';

@JsonSerializable()
class AlbumItem extends Equatable {
  const AlbumItem({
    required this.album,
  });

  factory AlbumItem.fromJson(Map<String, dynamic> json) =>
      _$AlbumItemFromJson(json);

  final Album album;

  @override
  List<Object?> get props => [album];
}
