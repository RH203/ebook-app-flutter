import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;

  void _isDarkChange() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Narrative"),
        actions: [
          IconButton(
            onPressed: _isDarkChange,
            icon: !isDark
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
        ],
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const DrawerHeader(
                child: Column(
              children: [
                Text("Narrative"),
                Text("lorem ipsum dolor sit amet"),
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Profile'),
                      onTap: () {
                        Navigator.pushNamed(context, '/profilscreen');
                      },
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
