import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/models/playlist_provider.dart';
import 'package:vibance/models/song.dart';
import 'package:vibance/pages/song_page.dart';

class BottomSongBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // Get the playlist
        final List<Song> playlist = value.playlist;

        // Ensure the current song index is valid
        final int currentIndex = value.currentSongIndex ?? 0;
        if (currentIndex >= playlist.length || currentIndex < 0) {
          return const SizedBox();
        }

        return (value.currentDuration > Duration.zero || value.isPlaying)
            ? GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SongPage(),
                    useSafeArea: true,
                    isScrollControlled: true,
                  );
                },
                child: AnimatedContainer(
                  padding: const EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  width: MediaQuery.of(context).size.width,
                  height: 92,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              playlist[currentIndex].songImagePath,
                              fit: BoxFit.cover,
                              // width: 60,
                              // height: 60,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            playlist[currentIndex].songName,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              value.playPreviousSong();
                            },
                            icon: const Icon(Icons.skip_previous_rounded),
                          ),
                          IconButton(
                            onPressed: () {
                              value.pauseOrResume();
                            },
                            icon: value.isPlaying
                                ? const Icon(Icons.pause_rounded)
                                : const Icon(Icons.play_arrow_rounded),
                          ),
                          IconButton(
                            onPressed: () {
                              value.playNextSong();
                            },
                            icon: const Icon(Icons.skip_next_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
