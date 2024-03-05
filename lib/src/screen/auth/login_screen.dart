import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NarrativeNet"),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            DrawerHeader(
              child: Image.asset(
                'assets/image/drawer/narrativenet.png',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Profile'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favorite'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text('Books'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.book),
                      title: const Text('Genre'),
                      onTap: () {},
                    ),
                  ],
                ),
                ToggleSwitch(
                  minWidth: 90.0,
                  minHeight: 70.0,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: const [
                    IconData(Icon(Icons.dark_mode)),
                    Icon(Icons.light_mode),
                  ],
                  iconSize: 30.0,
                  activeBgColors: const [
                    [Colors.black45, Colors.black26],
                    [Colors.yellow, Colors.orange]
                  ],
                  animate: true,
                  curve: Curves.bounceInOut,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
