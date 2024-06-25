import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String songName;
  final String artistName;
  final String imageUrl;

  const CustomListTile(
      {super.key,
      required this.songName,
      required this.artistName,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.amber),
        height: height / 10,
        width: width / 3,
        // color: Colors.red,
        child: Text(songName),
      ),
    );
  }
}
