import 'dart:async';
import 'dart:convert';

import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:spotify_api/spotify_api.dart';

import 'env/env.dart';

class SpotifyApiClient {
  SpotifyApiClient({OAuth2Helper? oAuth2Helper})
      : _oAuth2Helper = oAuth2Helper ??
            OAuth2Helper(
              SpotifyOAuth2Client(
                redirectUri: 'allsongsplaylist:/oauth2redirect',
                customUriScheme: 'allsongsplaylist',
              ),
              clientId: 'efbd4ddafc824641a5647f84a4be012a',
              clientSecret: Env.clientSecret,
              scopes: [
                'user-library-read',
                'playlist-modify-public',
                'playlist-modify-private',
              ],
            );

  final OAuth2Helper _oAuth2Helper;
  static const _baseUrl = 'api.spotify.com';

  Future<User> getCurrentUser() async {
    final request = Uri.https(
      _baseUrl,
      '/v1/me',
    );

    final response = await _oAuth2Helper.get(request.toString());

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return User.fromJson(responseJson);
  }

  Future<SavedAlbums> getSavedAlbums(int limit, int offset) async {
    final request = Uri.https(
      _baseUrl,
      '/v1/me/albums',
      {
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
    );

    final response = await _oAuth2Helper.get(request.toString());

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return SavedAlbums.fromJson(responseJson);
  }

  Future<Playlist> createPlaylist(
      String userId, String name, bool public) async {
    final request = Uri.https(
      _baseUrl,
      'v1/users/$userId/playlists',
    );

    final body = jsonEncode({
      'name': name,
      'public': public,
    });

    final response = await _oAuth2Helper.post(request.toString(), body: body);

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return Playlist.fromJson(responseJson);
  }

  Future<String> addItemsToPlaylist(
      String playlistId, Iterable<String> uris) async {
    final request = Uri.https(
      _baseUrl,
      'v1/playlists/$playlistId/tracks',
    );

    final body = jsonEncode({'uris': uris});

    final response = await _oAuth2Helper.post(request.toString(), body: body);

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return responseJson['snapshot_id'];
  }
}
