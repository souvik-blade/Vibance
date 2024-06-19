import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/components/neu_box.dart';
import 'package:vibance/models/playlist_provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  // convert duration into min:sec
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, "0");
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // get playlist
        final playlist = value.playlist;

        // get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];
        // return scaffold UI
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      Text("N O W    P L A Y I N G"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 50.0,
                  ),
                  // song image
                  NeuBox(
                    child: ClipRRect(
                      child: Image.asset(currentSong.songImagePath),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  SizedBox(height: 50.0),

                  // song progress bar
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // song name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  currentSong.artistName,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                            // like or unlike
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                  size: 28,
                                ))
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10),
                          inactiveTrackColor: Colors.grey.shade800,
                          activeTrackColor: Colors.purple.shade800,
                        ),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          onChanged: (double double) {
                            // when the user is sliding around
                          },
                          onChangeEnd: (double double) {
                            // sliding has finished go to that position in song duration
                            value.seek(
                              Duration(
                                seconds: double.toInt(),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // start time
                            Text(formatTime(value.currentDuration)),
                            // end time
                            Text(formatTime(value.totalDuration)),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  // playback controls
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            value.playPreviousSong();
                          },
                          child: NeuBox(
                            child: Icon(Icons.skip_previous),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            value.pauseOrResume();
                          },
                          child: NeuBox(
                            child: Icon(value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            value.playNextSong();
                          },
                          child: NeuBox(
                            child: Icon(Icons.skip_next),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
