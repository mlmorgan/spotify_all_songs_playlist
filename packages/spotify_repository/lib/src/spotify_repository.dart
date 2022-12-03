import 'dart:async';
import 'dart:developer';

import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_repository/spotify_repository.dart';

class SpotifyRepository {
  SpotifyRepository({SpotifyApiClient? spotifyApiClient})
      : _spotifyApiClient = spotifyApiClient ?? SpotifyApiClient();

  final SpotifyApiClient _spotifyApiClient;

  Future<void> createAllSongsPlaylist() async {
    final currentUser = await _getCurrentUser();

    final createdPlaylist = await _spotifyApiClient.createPlaylist(
        currentUser.id, "All Songs", false);

    final allSavedAlbumTracks = await _getAllSavedAlbumTracks();

    await _addTracksToPlaylist(createdPlaylist.id, allSavedAlbumTracks);
  }

  Future<User> _getCurrentUser() async {
    return await _spotifyApiClient.getCurrentUser();
  }

  Future<Set<String>> _getAllSavedAlbumTracks() async {
    int offset = 0;
    bool nextPageExists = true;
    Set<String> tracks = {};

    do {
      final savedAlbumsPage =
          await _spotifyApiClient.getSavedAlbums(50, offset);

      for (var album in savedAlbumsPage.items) {
        for (var track in album.album.tracks.items) {
          tracks.add(track.uri);
        }
      }

      offset += 50;
      nextPageExists = savedAlbumsPage.next != null;
    } while (nextPageExists);

    return tracks;
  }

  Future<void> _addTracksToPlaylist(
      String playlistId, Iterable<String> uris) async {
    int skipCount = 0;
    do {
      final tracksToAdd = uris.skip(skipCount).take(100).toList();

      await _spotifyApiClient.addItemsToPlaylist(playlistId, tracksToAdd);

      skipCount += 100;
    } while (skipCount <= uris.length);
  }
}
