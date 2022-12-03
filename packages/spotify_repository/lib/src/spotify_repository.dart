import 'dart:async';
import 'dart:developer';

import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_repository/spotify_repository.dart';

class SpotifyRepository {
  SpotifyRepository({SpotifyApiClient? spotifyApiClient})
      : _spotifyApiClient = spotifyApiClient ?? SpotifyApiClient();

  final SpotifyApiClient _spotifyApiClient;

  Future<void> createAllSongsPlaylist() async {
    int offset = 0;
    bool nextPageExists = true;
    Set<String> tracks = {};

    do {
      final savedAlbumsPage =
          await _spotifyApiClient.getSavedAlbums(50, offset);

      for (var album in savedAlbumsPage.items) {
        for (var track in album.album.tracks.items) {
          tracks.add(track.name);
        }
      }

      offset += 50;
      nextPageExists = savedAlbumsPage.next != null;
    } while (nextPageExists);
  }
}
