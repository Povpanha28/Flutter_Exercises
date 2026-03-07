import 'package:app/w7_small_hw/data/repositories/songs/song_repository.dart';
import 'package:app/w7_small_hw/model/songs/song.dart';

class UserHistorySong implements SongRepository {
  final List<Song> _historySongs = [
    Song(
      id: '101',
      title: 'Mock Song 1',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 2, seconds: 50),
    ),
    Song(
      id: '102',
      title: 'Mock Song 2',
      artist: 'Mock Artist',
      duration: const Duration(minutes: 3, seconds: 20),
    ),
  ];

  @override
  Song? fetchSongById(String id) {
    try {
      return _historySongs.firstWhere((song) => song.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  List<Song> fetchSongs() {
    return _historySongs;
  }
}
