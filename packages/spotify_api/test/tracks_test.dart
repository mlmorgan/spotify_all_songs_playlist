import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_api/src/models/tracks/tracks.dart';

void main() {
  group('Tracks', () {
    group('fromJson', () {
      test('return correct Tracks object', () {
        expect(
            Tracks.fromJson(const <String, dynamic>{
              'items': [],
            }),
            isA<Tracks>().having((w) => w.items, 'items', []));
      });
    });
  });
}
