import 'package:flutter/material.dart';
import 'package:novel_app/src/provider/theme/provider_theme.dart';

import 'package:novel_app/src/utils/welcome_utils/welcome_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  WelcomeUtils homescreen = WelcomeUtils();
  ProviderTheme _providerTheme = ProviderTheme();
  late List<String> data;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = homescreen.dataScreen(_index);
    getCurrentThemeApp();
  }

  void getCurrentThemeApp() async {
    _providerTheme.setDarkTheme();
    await _providerTheme.themePreferences.getTheme();
  }

  void _incrementAssets() {
    if (_index == 2) {
      Navigator.pushNamed(context, '/loginscreen');

      return;
    }
    setState(() {
      _index++;
      data = homescreen.dataScreen(_index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Image.asset(
                data[0],
                key: ValueKey<int>(_index),
                width: 380,
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Text(
                data[1],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 30,
                    ),
                textAlign: TextAlign.center,
                key: ValueKey<int>(_index),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 200,
                  height: 7,
                  color: Theme.of(context).colorScheme.onSurface,
                  key: ValueKey<int>(_index),
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                data[2],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
                    ),
                textAlign: TextAlign.center,
                key: ValueKey<int>(_index),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginscreen');
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: IconButton.filled(
                      onPressed: _incrementAssets,
                      icon: const Icon(Icons.keyboard_double_arrow_right_sharp),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
