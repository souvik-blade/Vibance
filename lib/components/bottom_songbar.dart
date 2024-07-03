import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/models/playlist_provider.dart';
import 'package:vibance/models/song.dart';

class BottomSongBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get the playlist
        final List<Song> playlist = value.playlist;

        return value.isPlaying
            ? AnimatedContainer(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                width: MediaQuery.of(context).size.width,
                height: 92,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(16)),
                duration: Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                              playlist[value.currentSongIndex ?? 0]
                                  .songImagePath),
                        ),
                        SizedBox(width: 16),
                        Text(
                          playlist[value.currentSongIndex ?? 0].songName,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            value.playPreviousSong();
                          },
                          icon: Icon(Icons.skip_previous_rounded),
                        ),
                        IconButton(
                          onPressed: () {
                            value.pauseOrResume();
                          },
                          icon: value.isPlaying
                              ? Icon(Icons.pause_rounded)
                              : Icon(Icons.play_arrow_rounded),
                        ),
                        IconButton(
                          onPressed: () {
                            value.playNextSong();
                          },
                          icon: Icon(Icons.skip_next_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : SizedBox();
      },
    );
  }
}
