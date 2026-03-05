import 'package:app/w7_small_hw/model/songs/song.dart';
import 'package:app/w7_small_hw/ui/states/settings_state.dart';
import 'package:app/w7_small_hw/ui/screens/library/view_model/library_view_model.dart';
import 'package:app/w7_small_hw/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
@override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final settingsState = context.watch<AppSettingsState>();

    if (viewModel.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Container(
        color: settingsState.theme.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text("Library", style: AppTextStyles.heading),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.songs.length,
                itemBuilder: (context, index) {
                  final song = viewModel.songs[index];
                  final isPlaying = viewModel.isSongPlaying(song);

                  return SongTile(
                    song: song,
                    isPlaying: isPlaying,
                    onTap: () {
                      viewModel.togglePlay(song);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
