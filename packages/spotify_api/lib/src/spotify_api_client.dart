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
        scopes: ['user-library-read']);
  }

  static const _baseUrl = 'api.spotify.com/v1';

  Future<SavedAlbums> getSavedAlbums(int limit, int offset) async {
    final savedAlbumsRequest = Uri.https(
      _baseUrl,
      '/me/albums',
      {
        'limit': limit,
        'offset': offset,
      },
    );

    final savedAlbumsResponse =
        await _oAuth2Helper.get(savedAlbumsRequest.toString());

    final savedAlbumsJson =
        jsonDecode(savedAlbumsResponse.body) as Map<String, dynamic>;

    return SavedAlbums.fromJson(savedAlbumsJson);
  }
}
