import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:novel_app/src/common/card/custom_card.dart';
import 'package:novel_app/src/provider/theme/provider_theme.dart';
import 'package:novel_app/src/utils/button/genre_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  GenreUtils _genreUtils = GenreUtils();

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
              _CarouselImage(),
              _GenreTextBody(),
              _ButtonGenreCustom(genreUtils: _genreUtils),
              _OnGoingCardCustom(),
              _PopularCardCustom(),
            ],
          ),
        ),
        floatingActionButton: _FloatingActionButtonCustom(),
        bottomNavigationBar: BottomNavigationBar(
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
      height: 270,
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
      height: 270,
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

class _ButtonGenreCustom extends StatelessWidget {
  const _ButtonGenreCustom({
    required GenreUtils genreUtils,
  }) : _genreUtils = genreUtils;

  final GenreUtils _genreUtils;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.only(left: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ..._genreUtils.genreTitle.map(
            (genre) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.surface),
                      ),
                      onPressed: () {},
                      child: Text(
                        genre,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _GenreTextBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        "Genre",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 30,
            ),
      ),
    );
  }
}

class _CarouselImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
