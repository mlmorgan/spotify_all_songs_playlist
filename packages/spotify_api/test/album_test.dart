import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_api/src/models/album/album.dart';
import 'package:spotify_api/src/models/tracks/tracks.dart';

void main() {
  group('Album', () {
    group('fromJson', () {
      test('return correct Album object', () {
        expect(
          Album.fromJson(const <String, dynamic>{
            'tracks': {
              'items': [],
            },
          }),
          isA<Album>().having(
            (w) => w.tracks,
            'tracks',
            const Tracks(items: []),
          ),
        );
      });
    });
  });
}
