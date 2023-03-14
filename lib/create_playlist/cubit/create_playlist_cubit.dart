import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:music_repository/music_repository.dart';

part 'create_playlist_state.dart';

class CreatePlaylistCubit extends Cubit<CreatePlaylistState> {
  CreatePlaylistCubit(this._musicRepository)
      : super(const CreatePlaylistState());

  final MusicRepository _musicRepository;

  Future<void> createAllSongsPlaylist(String playlistName) async {
    emit(state.copyWith(status: CreatePlaylistStatus.loading));

    try {
      await _musicRepository.createAllSongsPlaylist(playlistName);

      emit(state.copyWith(status: CreatePlaylistStatus.success));
    } catch (e) {
      if (e is PlaylistNameAlreadyExists) {
        emit(state.copyWith(
            status: CreatePlaylistStatus.playlistNameAlreadyExists));
      } else {
        emit(state.copyWith(status: CreatePlaylistStatus.failure));
      }
    }
  }
}
