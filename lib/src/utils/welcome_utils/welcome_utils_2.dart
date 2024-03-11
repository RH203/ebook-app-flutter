import 'package:flutter/material.dart';

class WelcomeUtils2 extends StatelessWidget {
  const WelcomeUtils2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 60, bottom: 120),
          child: Image.asset(
            "assets/image/homescreen/man-smartphone.png",
          ),
        ),
        Text(
          "Unlock the World of Stories: NarrativeNet",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 30,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
