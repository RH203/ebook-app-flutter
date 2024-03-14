import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
              child: Text("Message Screen"),
            )
          ],
        ),
      ),
    );
  }
}
