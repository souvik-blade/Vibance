import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';
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
          appBar: AppBar(
            title: const Text("N O W    P L A Y I N G"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  // song image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(currentSong.songImagePath),
                  ),

                  const SizedBox(height: 50.0),

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
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                  ),
                                ),
                                Text(
                                  currentSong.artistName,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            // like or unlike
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                  size: 28,
                                ))
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10),
                          inactiveTrackColor: Colors.grey.shade800,
                          activeTrackColor: Colors.purple.shade800,
                        ),
                        child: Slider(
                          min: 0.0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          onChanged: (double double) {
                            // when the user is sliding around
                            value.seek(Duration(seconds: double.toInt()));
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
                          onTap: () {},
                          child: const Icon(
                            Icons.shuffle_rounded,
                            size: 32,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              value.playPreviousSong();
                            },
                            child: Icon(
                              Icons.skip_previous_rounded,
                              size: 32,
                            )
                            // child: SvgPicture.asset(
                            //   width: 28,
                            //   height: 28,
                            //   "assets/icons/play_backward.svg",
                            // ),
                            ),
                      ),
                      const SizedBox(width: 20.0),
                      GestureDetector(
                        onTap: () {
                          value.pauseOrResume();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
                          child: Icon(
                              color: Theme.of(context).colorScheme.primary,
                              size: 58,
                              value.isPlaying
                                  ? Icons.pause_circle_filled_rounded
                                  : Icons.play_circle_filled_rounded),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              value.playNextSong();
                            },
                            child: Icon(
                              Icons.skip_next_rounded,
                              size: 32,
                            )
                            // child: SvgPicture.asset(
                            //   width: 28,
                            //   height: 28,
                            //   "assets/icons/play_forward.svg",
                            // ),
                            ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.repeat_rounded,
                            size: 32,
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
//#27193B