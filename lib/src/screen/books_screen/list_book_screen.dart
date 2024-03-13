import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ListBookScreen extends StatefulWidget {
  const ListBookScreen({super.key});

  @override
  State<ListBookScreen> createState() => _ListBookScreenState();
}

class _ListBookScreenState extends State<ListBookScreen> {
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
              child: Text("List Book Screen"),
            )
          ],
        ),
      ),
    );
  }
}
