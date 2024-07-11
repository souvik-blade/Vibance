import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibance/themes/theme_provider.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("S E T T I N G S"),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // dark mode
                const Text(
                  "Dark Mode",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                // Switch
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
