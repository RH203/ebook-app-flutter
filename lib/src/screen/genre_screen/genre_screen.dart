import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(OctIcons.arrow_left),
          onPressed: () => Navigator.popAndPushNamed(context, '/mainscreen'),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [
            Center(
              child: Text("Genre Screen"),
            )
          ],
        ),
      ),
    );
  }
}
