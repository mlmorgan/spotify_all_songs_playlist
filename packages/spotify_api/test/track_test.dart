import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_api/src/models/track/track.dart';

void main() {
  group('Track', () {
    group('fromJson', () {
      test('return correct Track object', () {
        expect(
          Track.fromJson(const <String, dynamic>{
            'name': 'name',
            'uri': 'uri',
          }),
          isA<Track>()
              .having((w) => w.name, 'name', 'name')
              .having((w) => w.uri, 'uri', 'uri'),
        );
      });
    });
  });
}
