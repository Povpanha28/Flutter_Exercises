import 'package:app/w7_small_hw/data/repositories/songs/song_repository.dart';
import 'package:app/w7_small_hw/ui/screens/home/view_model/home_view_model.dart';
import 'package:app/w7_small_hw/ui/screens/home/widgets/home_content.dart';
import 'package:app/w7_small_hw/ui/states/player_state.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SongRepository songRepository = context.read<SongRepository>();
    final PlayerState playerState = context.watch<PlayerState>();
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        songRepository: songRepository,
        playerState: playerState,
      )..init(),
      child: HomeContent(),
    );
  }
}
