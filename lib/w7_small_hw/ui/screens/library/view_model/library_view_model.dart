import 'package:flutter/foundation.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final PlayerState _playerState;

  List<Song> _songs = [];
  bool _isLoading = false;

  LibraryViewModel({
    required SongRepository songRepository,
    required PlayerState playerState,
  }) : _songRepository = songRepository,
       _playerState = playerState {
    _playerState.addListener(_onPlayerStateChanged);
  }

  // Getters for UI
  List<Song> get songs => _songs;
  bool get isLoading => _isLoading;
  Song? get currentSong => _playerState.currentSong;
  bool get isPlaying => false;

  // Initialize - fetch songs from repository
  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    _songs = await _songRepository.fetchSongs();

    _isLoading = false;
    notifyListeners();
  }

  // Listen to PlayerState changes
  void _onPlayerStateChanged() {
    notifyListeners();
  }

  // User actions
  void play(Song song) {
    _playerState.start(song);
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

  @override
  void dispose() {
    _playerState.removeListener(_onPlayerStateChanged);
    super.dispose();
  }
}
