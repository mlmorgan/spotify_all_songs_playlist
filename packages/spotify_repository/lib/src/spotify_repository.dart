import 'dart:async';

import 'package:spotify_api/spotify_api.dart';

class PlaylistNameAlreadyExists implements Exception {}

class SpotifyRepository {
  SpotifyRepository({SpotifyApiClient? spotifyApiClient})
      : _spotifyApiClient = spotifyApiClient ?? SpotifyApiClient();

  final SpotifyApiClient _spotifyApiClient;

  Future<void> createAllSongsPlaylist(String playlistName) async {
    final currentUser = await _getCurrentUser();

    final savedPlaylistNames = await _getAllSavedPlaylistNames();

    if (savedPlaylistNames.contains(playlistName)) {
      throw PlaylistNameAlreadyExists();
    }

    final createdPlaylist = await _spotifyApiClient.createPlaylist(
      currentUser.id,
      playlistName,
      false,
    );

    final allSavedAlbumTrackUris = await _getAllSavedAlbumTrackUris();

    await _addTracksToPlaylist(createdPlaylist.id, allSavedAlbumTrackUris);
  }

  Future<User> _getCurrentUser() async {
    return await _spotifyApiClient.getCurrentUser();
  }

  Future<Set<String>> _getAllSavedAlbumTrackUris() async {
    int offset = 0;
    bool nextPageExists = true;
    Set<String> trackUris = {};

    do {
      final savedAlbumsPage =
          await _spotifyApiClient.getSavedAlbums(50, offset);

      for (var album in savedAlbumsPage.items) {
        for (var track in album.album.tracks.items) {
          trackUris.add(track.uri);
        }
      }

      offset += 50;
      nextPageExists = savedAlbumsPage.next != null;
    } while (nextPageExists);

    return trackUris;
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

  Future<Set<String>> _getAllSavedPlaylistNames() async {
    int offset = 0;
    bool nextPageExists = true;
    Set<String> playlistNames = {};

    do {
      final savedPlaylistsPage =
          await _spotifyApiClient.getFollowedPlaylists(50, offset);

      for (var playlist in savedPlaylistsPage.items) {
        playlistNames.add(playlist.name);
      }

      offset += 50;
      nextPageExists = savedPlaylistsPage.next != null;
    } while (nextPageExists);

    return playlistNames;
  }
}
