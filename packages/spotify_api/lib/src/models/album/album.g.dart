// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Album',
      json,
      ($checkedConvert) {
        final val = Album(
          tracks: $checkedConvert(
              'tracks', (v) => Tracks.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
