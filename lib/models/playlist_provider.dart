import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vibance/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlists of songs
  final List<Song> _playlist = [
    // song 1
    Song(
        songName: "Riptide",
        artistName: "The Chainsmokers",
        songImagePath: "assets/images/riptide.png",
        audioPath:
            "audios/Y2meta.app - The Chainsmokers - Riptide (Official Lyric Video) (320 kbps).mp3"),

    // song 2
    Song(
        songName: "I Love You",
        artistName: "The Chainsmokers",
        songImagePath:
            "assets/images/The Chainsmokers - So Far So Good (Explicit) - Vinyl.png",
        audioPath:
            "audios/Y2meta.app - The Chainsmokers - I Love U (Official Lyric Video) (320 kbps).mp3"),

    // song 3
    Song(
        songName: "Where's My Love",
        artistName: "SYML",
        songImagePath: "assets/images/SYML.png",
        audioPath:
            "audios/Y2meta.app - SYML - _Where's My Love_ [Official Audio] (320 kbps).mp3"),

    // song 4
    Song(
        songName: "STARBOY",
        artistName: "The Weeknd",
        songImagePath: "assets/images/starboy.png",
        audioPath:
            "audios/Y2meta.app - The Weeknd - Starboy (Audio) ft. Daft Punk (320 kbps).mp3"),
    // song 1
    Song(
        songName: "Riptide",
        artistName: "The Chainsmokers",
        songImagePath: "assets/images/riptide.png",
        audioPath:
            "audios/Y2meta.app - The Chainsmokers - Riptide (Official Lyric Video) (320 kbps).mp3"),

    // song 2
    Song(
        songName: "I Love You",
        artistName: "The Chainsmokers",
        songImagePath:
            "assets/images/The Chainsmokers - So Far So Good (Explicit) - Vinyl.png",
        audioPath:
            "audios/Y2meta.app - The Chainsmokers - I Love U (Official Lyric Video) (320 kbps).mp3"),

    // song 3
    Song(
        songName: "Where's My Love",
        artistName: "SYML",
        songImagePath: "assets/images/SYML.png",
        audioPath:
            "audios/Y2meta.app - SYML - _Where's My Love_ [Official Audio] (320 kbps).mp3"),

    // song 4
    Song(
        songName: "STARBOY",
        artistName: "The Weeknd",
        songImagePath: "assets/images/starboy.png",
        audioPath:
            "audios/Y2meta.app - The Weeknd - Starboy (Audio) ft. Daft Punk (320 kbps).mp3"),
    // song 1
    Song(
        songName: "Riptide",
        artistName: "The Chainsmokers",
        songImagePath: "assets/images/riptide.png",
        audioPath:
            "audios/Y2meta.app - The Chainsmokers - Riptide (Official Lyric Video) (320 kbps).mp3"),

    // song 2
    Song(
        songName: "I Love You",
        artistName: "The Chainsmokers",
        songImagePath:
            "assets/images/The Chainsmokers - So Far So Good (Explicit) - Vinyl.png",
        audioPath:
            "audios/Y2meta.app - The Chainsmokers - I Love U (Official Lyric Video) (320 kbps).mp3"),

    // song 3
    Song(
        songName: "Where's My Love",
        artistName: "SYML",
        songImagePath: "assets/images/SYML.png",
        audioPath:
            "audios/Y2meta.app - SYML - _Where's My Love_ [Official Audio] (320 kbps).mp3"),

    // song 4
    Song(
        songName: "STARBOY",
        artistName: "The Weeknd",
        songImagePath: "assets/images/starboy.png",
        audioPath:
            "audios/Y2meta.app - The Weeknd - Starboy (Audio) ft. Daft Punk (320 kbps).mp3"),
    // song 1
    Song(
        songName: "Riptide",
        artistName: "The Chainsmokers",
        songImagePath: "assets/images/riptide.png",
        audioPath:
            "audios/Y2meta.app - The Chainsmokers - Riptide (Official Lyric Video) (320 kbps).mp3"),

    // song 2
    Song(
        songName: "I Love You",
        artistName: "The Chainsmokers",
        songImagePath:
            "assets/images/The Chainsmokers - So Far So Good (Explicit) - Vinyl.png",
        audioPath:
            "audios/Y2meta.app - The Chainsmokers - I Love U (Official Lyric Video) (320 kbps).mp3"),

    // song 3
    Song(
        songName: "Where's My Love",
        artistName: "SYML",
        songImagePath: "assets/images/SYML.png",
        audioPath:
            "audios/Y2meta.app - SYML - _Where's My Love_ [Official Audio] (320 kbps).mp3"),

    // song 4
    Song(
        songName: "STARBOY",
        artistName: "The Weeknd",
        songImagePath: "assets/images/starboy.png",
        audioPath:
            "audios/Y2meta.app - The Weeknd - Starboy (Audio) ft. Daft Punk (320 kbps).mp3"),
  ];

  // index of current song playing
  int? _currentSongIndex;

  // AUDIO PLAYER
  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play new song
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to specifif position
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // go to next song if its not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // go to next song if its the last song
        currentSongIndex = 0;
      }
    }
  }

  // play previous song
  void playPreviousSong() {
    // if more than 3 seconds have passed, replay current song
    if (_currentDuration.inSeconds > 3) {
      seek(Duration.zero);
    }
    // if its within 3 seconds play the previous song
    else {
      if (_currentSongIndex! > 0) {
        // go to next song if its not the last song
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // if its the first song loop back to last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    // listen for total durartion
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen for song complete
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // dispose audio player
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // GETTERS
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //SETTERS
  set currentSongIndex(int? newIndex) {
    // update current  song Index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // play the song at the new index
    }

    // Update UI
    notifyListeners();
  }
}
