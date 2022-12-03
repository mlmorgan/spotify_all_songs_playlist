import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';

import 'secrets.dart';

class SpotifyAPI {
  late OAuth2Helper oauth2Helper;

  SpotifyAPI() {
    final OAuth2Client client = SpotifyOAuth2Client(
      redirectUri: 'allsongsplaylist:/oauth2redirect',
      customUriScheme: 'allsongsplaylist',
    );

    oauth2Helper = OAuth2Helper(
      client,
      clientId: 'efbd4ddafc824641a5647f84a4be012a',
      clientSecret: spotifyClientSecret,
    );
  }

  testSpotify() {
    oauth2Helper.get('https://api.spotify.com/v1/me');
  }
}
