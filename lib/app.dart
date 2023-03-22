import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_repository/music_repository.dart';

import 'create_playlist/create_playlist.dart';

class AllSongsApp extends StatelessWidget {
  const AllSongsApp({super.key, required MusicRepository musicRepository})
      : _musicRepository = musicRepository;

  final MusicRepository _musicRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _musicRepository,
      child: const AllSongsAppView(),
    );
  }
}

class AllSongsAppView extends StatelessWidget {
  const AllSongsAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreatePlaylistPage(),
    );
  }
}
