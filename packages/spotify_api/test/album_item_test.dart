import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_api/src/models/album/album.dart';
import 'package:spotify_api/src/models/album_item/album_item.dart';
import 'package:spotify_api/src/models/tracks/tracks.dart';

void main() {
  group('AlbumItem', () {
    group('fromJson', () {
      test('return correct AlbumItem object', () {
        expect(
          AlbumItem.fromJson(const <String, dynamic>{
            'album': {
              'tracks': {
                'items': [],
              },
            },
          }),
          isA<AlbumItem>().having(
            (w) => w.album,
            'album',
            const Album(tracks: Tracks(items: [])),
          ),
        );
      });
    });
  });
}
