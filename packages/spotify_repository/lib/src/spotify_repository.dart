import 'dart:async';

import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_repository/spotify_repository.dart';

class SpotifyRepository {
  SpotifyRepository({SpotifyApiClient? spotifyApiClient})
      : _spotifyApiClient = spotifyApiClient ?? SpotifyApiClient();

  final SpotifyApiClient _spotifyApiClient;

  Future<SavedAlbums> createAllSongsPlaylist() async {
    return await _spotifyApiClient.getSavedAlbums(50, 0);
  }
}
