import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';

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
      clientSecret: '41a0b0633f7f437fb02e76c7b3baf1d5',
    );
  }

  testSpotify() {
    oauth2Helper.get('https://api.spotify.com/v1/me');
  }
}
