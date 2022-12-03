// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'album_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumItem _$AlbumItemFromJson(Map<String, dynamic> json) => $checkedCreate(
      'AlbumItem',
      json,
      ($checkedConvert) {
        final val = AlbumItem(
          album: $checkedConvert(
              'album', (v) => Album.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
