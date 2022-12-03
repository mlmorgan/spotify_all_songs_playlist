// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'saved_albums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedAlbums _$SavedAlbumsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SavedAlbums',
      json,
      ($checkedConvert) {
        final val = SavedAlbums(
          href: $checkedConvert('href', (v) => v as String),
          limit: $checkedConvert('limit', (v) => v as int),
          next: $checkedConvert('next', (v) => v as String?),
          offset: $checkedConvert('offset', (v) => v as int),
          previous: $checkedConvert('previous', (v) => v as String?),
          total: $checkedConvert('total', (v) => v as int),
        );
        return val;
      },
    );
