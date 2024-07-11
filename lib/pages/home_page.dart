import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/components/bottom_songbar.dart';
import 'package:vibance/models/playlist_provider.dart';
import 'package:vibance/models/song.dart';

import 'package:vibance/pages/song_page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  // get playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    // get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  // go to song
  void goToSong(int songIndex) {
    // update current song index
    playlistProvider.currentSongIndex = songIndex;

    // navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get the playlist
        final List<Song> playlist = value.playlist;
        //return list view UI

        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                "S O N G S",
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: playlist.length,
                  itemBuilder: (context, index) {
                    // get individual song
                    final Song song = playlist[index];

                    // return list view UI
                    return ListTile(
                      title: Text(song.songName),
                      subtitle: Text(song.artistName),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_rounded),
                      ),
                      onTap: () {
                        goToSong(index);
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20), // Maintain rounded corners
                        child: Container(
                          // Adjust height and width for desired image size
                          height: 150, // Example height, adjust as needed
                          width: 100, // Example width, adjust as needed
                          child: Image.asset(song.songImagePath),
                        ),
                      ),
                    );
                  },
                ),
              ),
              BottomSongBar(),
            ],
          ),
        );
      },
    );
  }
}
