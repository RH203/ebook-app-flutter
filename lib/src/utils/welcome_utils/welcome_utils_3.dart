import 'package:flutter/material.dart';

class WelcomeUtils3 extends StatelessWidget {
  const WelcomeUtils3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40, bottom: 120),
          child: Image.asset(
            "assets/image/homescreen/women-smartphone-2.png",
          ),
        ),
        Text(
          "Start your journey into the world of stories now!",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 30,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
