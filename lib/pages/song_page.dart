import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/models/playlist_provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("S O N G")),
        ),
        body: Stack(
          children: [
            // song image
          ],
        ),
      ),
    );
  }
}
