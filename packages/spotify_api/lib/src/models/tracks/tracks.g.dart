// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'tracks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracks _$TracksFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Tracks',
      json,
      ($checkedConvert) {
        final val = Tracks(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => Track.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
