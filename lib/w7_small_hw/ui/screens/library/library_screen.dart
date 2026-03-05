import 'package:app/w6_t2/ui/states/settings_state.dart';
import 'package:app/w7_small_hw/ui/screens/library/view_model/library_view_model.dart';
import 'package:app/w7_small_hw/ui/screens/library/widgets/library_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    SongRepository songRepository = context.read<SongRepository>();
    PlayerState playerState = context.watch<PlayerState>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LibraryViewModel(
            songRepository: songRepository,
            playerState: playerState,
          )..init(),
        ),
        ChangeNotifierProvider(create: (context) => AppSettingsState()),
      ],
      child: const LibraryContent(),
    );
  }
}
