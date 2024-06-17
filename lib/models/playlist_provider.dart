import 'package:flutter/material.dart';
import 'package:vibance/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlists of songs
  final List<Song> _playlist = [
    // song 1
    Song(
        songName: "Riptide",
        artistName: "The Chainsmokers",
        songImagePath: "assets/images/riptide.jpg",
        audioPath:
            "assets/audios/Y2meta.app - The Chainsmokers - Riptide (Official Lyric Video) (320 kbps).mp3"),

    // song 2
    Song(
        songName: "I Love You",
        artistName: "The Chainsmokers",
        songImagePath: "assets/images/i love you.jpg",
        audioPath:
            "assets/audios/Y2meta.app - The Chainsmokers - I Love U (Official Lyric Video) (320 kbps).mp3"),

    // song 3
    Song(
        songName: "Where's My Love",
        artistName: "SYML",
        songImagePath: "assets/images/Shades.jpg",
        audioPath:
            "assets/audios/Y2meta.app - SYML - _Where's My Love_ [Official Audio] (320 kbps).mp3"),

    // song 4
    Song(
        songName: "STARBOY",
        artistName: "The Weeknd",
        songImagePath: "assets/images/STABOY wallpaper.jpg",
        audioPath:
            "assets/audios/Y2meta.app - The Weeknd - Starboy (Audio) ft. Daft Punk (320 kbps).mp3"),
  ];

  // index of current song playing
  int? _currentSongIndex;

  // GETTERS
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //SETTERS
  set currentSongIndex(int? newIndex) {
    // update current  song Index
    _currentSongIndex = newIndex;

    // Update UI
    notifyListeners();
  }
}
