import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_api/src/models/saved_albums/saved_albums.dart';

void main() {
  group('SavedAlbums', () {
    group('fromJson', () {
      test('return correct SavedAlbums object', () {
        expect(
          SavedAlbums.fromJson(const <String, dynamic>{
            'href': 'href',
            'items': [],
            'limit': 50,
            'next': 'next',
            'offset': 0,
            'previous': 'previous',
            'total': 100,
          }),
          isA<SavedAlbums>()
              .having((w) => w.href, 'href', 'href')
              .having((w) => w.items, 'items', [])
              .having((w) => w.limit, 'limit', 50)
              .having((w) => w.next, 'next', 'next')
              .having((w) => w.offset, 'offset', 0)
              .having((w) => w.previous, 'previous', 'previous')
              .having((w) => w.total, 'total', 100),
        );
      });
    });
  });
}
