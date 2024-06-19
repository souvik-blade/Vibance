import 'package:flutter/material.dart';
import 'package:vibance/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// home tile
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text("H O M E"),
              onTap: () => Navigator.pop(context),
            ),
          ),

          // settings tile
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text("S E T T I N G S"),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserSettingsPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
