import 'package:flutter/material.dart';

class WelcomeUtils1 extends StatelessWidget {
  const WelcomeUtils1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 60, bottom: 120),
          child: Image.asset(
            "assets/image/homescreen/women-smartphone.png",
          ),
        ),
        Text(
          "Discover millions of your favorite novel in one app.",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 30,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
