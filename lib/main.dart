import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/models/playlist_provider.dart';
import 'package:vibance/pages/home_page.dart';
import 'package:vibance/themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlaylistProvider(),
        ),
      ],
      child: const vibance(),
    ),
  );
}

class vibance extends StatelessWidget {
  const vibance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
