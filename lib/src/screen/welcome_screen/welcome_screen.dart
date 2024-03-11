import 'package:flutter/material.dart';
import 'package:novel_app/src/provider/theme/provider_theme.dart';
import 'package:novel_app/src/utils/welcome_utils/welcome_utils_1.dart';
import 'package:novel_app/src/utils/welcome_utils/welcome_utils_2.dart';
import 'package:novel_app/src/utils/welcome_utils/welcome_utils_3.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ProviderTheme _providerTheme = ProviderTheme();
  PageController _controller = PageController();
  bool _onLastPage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentThemeApp();
  }

  void getCurrentThemeApp() async {
    _providerTheme.setDarkTheme();
    await _providerTheme.themePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  _onLastPage = (value == 2);
                });
              },
              children: const [
                WelcomeUtils1(),
                WelcomeUtils2(),
                WelcomeUtils3(),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/mainscreen'),
                    child: const Text("Skip"),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ScrollingDotsEffect(
                      dotWidth: 20,
                      activeDotColor:
                          Theme.of(context).colorScheme.surfaceVariant,
                    ),
                  ),
                  _onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/mainscreen');
                          },
                          child: const Text("Done"),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: const Text("Next"),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
