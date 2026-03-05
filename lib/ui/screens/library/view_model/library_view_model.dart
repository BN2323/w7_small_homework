import 'package:flutter/foundation.dart';
import 'package:w7_small_homework/data/repositories/songs/song_repository.dart';
import 'package:w7_small_homework/model/songs/song.dart';
import 'package:w7_small_homework/ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final PlayerState _playerState;
  List<Song> _songs = [];

  LibraryViewModel(this._songRepository, this._playerState);

  void init() {
    _songs = _songRepository.fetchSongs();

    _playerState.addListener(() {
      notifyListeners();
    });
  }

  List<Song> get songs => _songs;

  Song? get currentSong => _playerState.currentSong;

  bool isPlaying(Song song) {
    return _playerState.currentSong == song;
  }

  void play(Song song) {
    _playerState.start(song);
  }
}