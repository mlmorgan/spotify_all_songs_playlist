import 'dart:async';
import 'dart:convert';

import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:spotify_api/spotify_api.dart';

import 'env/env.dart';

class SpotifyApiClient {
  late OAuth2Helper _oAuth2Helper;

  SpotifyApiClient() {
    final OAuth2Client oAuth2Client = SpotifyOAuth2Client(
      redirectUri: 'allsongsplaylist:/oauth2redirect',
      customUriScheme: 'allsongsplaylist',
    );

    _oAuth2Helper = OAuth2Helper(oAuth2Client,
        clientId: 'efbd4ddafc824641a5647f84a4be012a',
        clientSecret: Env.clientSecret,
        scopes: [
          'user-library-read',
          'playlist-modify-public',
          'playlist-modify-private',
        ]);
  }

  static const _baseUrl = 'api.spotify.com';

  Future<User> getCurrentUser() async {
    final getCurrentUserRequest = Uri.https(
      _baseUrl,
      '/v1/me',
    );

    final getCurrentUserResponse =
        await _oAuth2Helper.get(getCurrentUserRequest.toString());

    final getCurrentUserJson =
        jsonDecode(getCurrentUserResponse.body) as Map<String, dynamic>;

    return User.fromJson(getCurrentUserJson);
  }

  Future<SavedAlbums> getSavedAlbums(int limit, int offset) async {
    final savedAlbumsRequest = Uri.https(
      _baseUrl,
      '/v1/me/albums',
      {
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
    );

    final savedAlbumsResponse =
        await _oAuth2Helper.get(savedAlbumsRequest.toString());

    final savedAlbumsJson =
        jsonDecode(savedAlbumsResponse.body) as Map<String, dynamic>;

    return SavedAlbums.fromJson(savedAlbumsJson);
  }

  Future<Playlist> createPlaylist(
      String userId, String name, bool public) async {
    final createPlaylistRequest = Uri.https(
      _baseUrl,
      'v1/users/$userId/playlists',
    );

    final requestBody = jsonEncode({
      'name': name,
      'public': public,
    });

    final createPlaylistResponse = await _oAuth2Helper
        .post(createPlaylistRequest.toString(), body: requestBody);

    final createPlaylistJson =
        jsonDecode(createPlaylistResponse.body) as Map<String, dynamic>;

    return Playlist.fromJson(createPlaylistJson);
  }

  Future<void> addItemsToPlaylist(
      String playlistId, Iterable<String> uris) async {
    final addItemsToPlaylistRequest = Uri.https(
      _baseUrl,
      'v1/playlists/$playlistId/tracks',
    );

    final requestBody = jsonEncode({'uris': uris});

    final response = await _oAuth2Helper
        .post(addItemsToPlaylistRequest.toString(), body: requestBody);
  }
}
