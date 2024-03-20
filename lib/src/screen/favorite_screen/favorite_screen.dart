import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
              child: Text("Favorite Screen"),
            )
          ],
        ),
      ),
    );
  }
}
