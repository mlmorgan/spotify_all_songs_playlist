part of 'create_playlist_cubit.dart';

enum CreatePlaylistStatus {
  initial,
  loading,
  success,
  playlistNameAlreadyExists,
  failure,
}

class CreatePlaylistState extends Equatable {
  const CreatePlaylistState({
    this.status = CreatePlaylistStatus.initial,
    this.playlistName = "All Songs",
    this.playlistUri,
  });

  final CreatePlaylistStatus status;
  final String playlistName;
  final String? playlistUri;

  CreatePlaylistState copyWith({
    CreatePlaylistStatus? status,
    String? playlistName,
    String? playlistUri,
  }) {
    return CreatePlaylistState(
      status: status ?? this.status,
      playlistName: playlistName ?? this.playlistName,
      playlistUri: playlistUri ?? this.playlistUri,
    );
  }

  @override
  List<Object?> get props => [status, playlistName, playlistUri];
}
