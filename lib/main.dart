import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_repository/music_repository.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AllSongsApp(musicRepository: MusicRepository()));
}