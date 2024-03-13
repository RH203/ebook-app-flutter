import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 200,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/mainscreen/sample-image.jpeg",
            width: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.remove_red_eye_outlined,
                    size: 17,
                  ),
                  Text(
                    "12.0K",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                        ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    AntDesign.fire_outline,
                    size: 17,
                  ),
                  Text(
                    "Rame",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 12,
                        ),
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 2),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Title",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                  ),
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
