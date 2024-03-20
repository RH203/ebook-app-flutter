import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:novel_app/src/common/card/custom_card.dart';
import 'package:novel_app/src/provider/theme/provider_theme.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;
  int _currentPageIndex = 0;
  void isChangeTheme() {
    setState(() {
      Provider.of<ProviderTheme>(context, listen: false).toggleTheme();
    });
  }

  final List<String> pages = [
    '/mainscreen',
    '/profilscreen',
    '/favoritescreen',
    '/booksscreen',
    '/genrescreen'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderTheme>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/searchscreen'),
              icon: Icon(
                IonIcons.search,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            IconButton(
              onPressed: isChangeTheme,
              icon: value.darkTheme
                  ? const Icon(
                      Icons.light_mode,
                    )
                  : Icon(
                      Icons.dark_mode,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
            ),
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider(
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: Center(
                                child: Text(
                                  'Image novel app $i',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        initialPage: 0,
                        height: 150,
                        reverse: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(
                            () {
                              _currentCarouselIndex = index;
                            },
                          );
                        },
                      ),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: _currentCarouselIndex,
                      count: 5,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Theme.of(context).colorScheme.surface,
                      ),
                    )
                  ],
                ),
              ),
              _OnGoingCardCustom(),
              _PopularCardCustom(),
            ],
          ),
        ),
        floatingActionButton: _FloatingActionButtonCustom(),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).colorScheme.surface,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedItemColor: Theme.of(context).colorScheme.onSurface,
              selectedItemColor: Theme.of(context).colorScheme.onSurface,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Person",
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label: "Favorite",
                  icon: Icon(Icons.favorite_outlined),
                ),
                BottomNavigationBarItem(
                  label: "Books",
                  icon: Icon(Icons.book),
                ),
                BottomNavigationBarItem(
                  label: "Genre",
                  icon: Icon(Icons.bookmark),
                ),
              ],
              currentIndex: _currentPageIndex,
              onTap: (value) => setState(
                () {
                  Navigator.popAndPushNamed(context, pages[value]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButtonCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.background,
      onPressed: () => Navigator.pushNamed(context, '/messagescreen'),
      child: Icon(
        Icons.message,
        size: 30,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

class _PopularCardCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      margin: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Populer",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 30,
                ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OnGoingCardCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      margin: const EdgeInsets.only(top: 20, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ongoing",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 30,
                ),
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
