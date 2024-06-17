import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/components/my_drawer.dart';
import 'package:vibance/models/playlist_provider.dart';
import 'package:vibance/models/song.dart';
import 'package:vibance/pages/song_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    // TODO: implement initState
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
        builder: (context) => SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "P L A Y L I S T",
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get the playlist
          final List<Song> playlist = value.playlist;

          //return list view UI
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              // get individual song
              final Song song = playlist[index];

              // return list view UI
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
