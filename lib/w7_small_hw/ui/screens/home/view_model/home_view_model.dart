import 'package:app/w7_small_hw/data/repositories/songs/song_repository.dart';
import 'package:app/w7_small_hw/model/songs/song.dart';
import 'package:app/w7_small_hw/ui/states/player_state.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final PlayerState _playerState;

  List<Song> _songs = [];
  List<Song> _recentSong = [];

  HomeViewModel({
    required SongRepository songRepository,
    required PlayerState playerState,
  }) : _songRepository = songRepository,
       _playerState = playerState {
    _playerState.addListener(_onPlayerStateChanged);
  }

  // Getters for UI
  List<Song> get songs => _songs;
  List<Song> get recentSongs => _recentSong;
  Song? get currentSong => _playerState.currentSong;
  bool get isPlaying => false;

  // Initialize - fetch songs from repository
  Future<void> init() async {
    _songs = await _songRepository.fetchSongs();
    notifyListeners();
  }

  // add recent song
  void addRecentSong(Song song) {
    _recentSong.removeWhere((s) => s.id == song.id); // Remove if exists
    _recentSong.insert(0, song); // Add to beginning
    notifyListeners();
  }

  // User actions
  void play(Song song) {
    _playerState.start(song);
    addRecentSong(song); // Add when playing
  }

  void stop() {
    _playerState.stop();
  }

  void togglePlay(Song song) {
    if (isSongPlaying(song)) {
      stop();
    } else {
      play(song);
    }
  }

  bool isSongPlaying(Song song) {
    return currentSong == song;
  }

  // Listen to PlayerState changes
  void _onPlayerStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _playerState.removeListener(_onPlayerStateChanged);
    super.dispose();
  }
}
