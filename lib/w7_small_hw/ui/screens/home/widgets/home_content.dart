import 'package:app/w7_small_hw/model/songs/song.dart';
import 'package:app/w7_small_hw/ui/screens/home/view_model/home_view_model.dart';
import 'package:app/w7_small_hw/ui/states/settings_state.dart';
import 'package:app/w7_small_hw/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel vm = context.watch<HomeViewModel>();
    final settingsState = context.watch<AppSettingsState>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),
          const SizedBox(height: 50),

          // Recently Played Section
          Text("Recently Played", style: AppTextStyles.body),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: vm.recentSongs.length,
            itemBuilder: (context, index) {
              final song = vm.recentSongs[index];
              final isPlaying = vm.isSongPlaying(song);

              return SongTile(
                song: song,
                isPlaying: isPlaying,
                onTap: () {
                  vm.togglePlay(song);
                },
              );
            },
          ),

          const SizedBox(height: 32),

          // Songs You Might Like Section
          Text("Songs you might like !!", style: AppTextStyles.body),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: vm.songs.length,
            itemBuilder: (context, index) {
              final song = vm.songs[index];
              final isPlaying = vm.isSongPlaying(song);

              return SongTile(
                song: song,
                isPlaying: isPlaying,
                onTap: () {
                  vm.togglePlay(song);
                },
              );
            },
          ),
        ],
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
