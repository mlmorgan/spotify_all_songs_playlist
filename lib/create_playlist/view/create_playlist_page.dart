import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_repository/music_repository.dart';

import '../create_playlist.dart';

class CreatePlaylistPage extends StatelessWidget {
  const CreatePlaylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePlaylistCubit(context.read<MusicRepository>()),
      child: const CreatePlaylistView(),
    );
  }
}

class CreatePlaylistView extends StatefulWidget {
  const CreatePlaylistView({Key? key}) : super(key: key);

  @override
  State<CreatePlaylistView> createState() => _CreatePlaylistViewState();
}

class _CreatePlaylistViewState extends State<CreatePlaylistView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Songs Playlist"),
      ),
      body: BlocConsumer<CreatePlaylistCubit, CreatePlaylistState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Give your playlist a name"),
                const TextField(),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CreatePlaylistCubit>()
                        .createAllSongsPlaylist("All songs");
                  },
                  child: state.status == CreatePlaylistStatus.loading
                      ? const CircularProgressIndicator()
                      : const Text("Create"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
