// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Track',
      json,
      ($checkedConvert) {
        final val = Track(
          name: $checkedConvert('name', (v) => v as String),
          uri: $checkedConvert('uri', (v) => v as String),
        );
        return val;
      },
    );
