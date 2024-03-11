import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:novel_app/src/provider/theme/provider_theme.dart';
import 'package:novel_app/src/utils/button/genre_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GenreUtils _genreUtils = GenreUtils();
  void _isChangeTheme() {
    setState(() {
      Provider.of<ProviderTheme>(context, listen: false).toggleTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Consumer<ProviderTheme>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: value.darkTheme
              ? const Color(0xFF1C1B1F)
              : const Color(0xFF45158A),
          actions: [
            IconButton(
              onPressed: _isChangeTheme,
              icon: value.darkTheme
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            ),
          ],
          elevation: 0,
        ),
        drawer: _Drawer(),
        body: Column(
          children: [
            _CarouselImage(),
            _SearchBarCustom(searchController: searchController),
            _GenreTextBody(),
            _ButtonGenreCustom(genreUtils: _genreUtils),
          ],
        ),
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
                        style: TextStyle(color: Colors.white),
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
      margin: const EdgeInsets.only(left: 15),
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

class _SearchBarCustom extends StatelessWidget {
  const _SearchBarCustom({
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      width: 320,
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          hintText: "Search",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
          filled: true,
          fillColor:
              Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
          contentPadding: const EdgeInsets.all(15),
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
            return Consumer<ProviderTheme>(
              builder: (context, value, child) => Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: value.darkTheme
                      ? const Color.fromARGB(255, 70, 69, 70)
                      : const Color.fromARGB(255, 88, 37, 161),
                ),
                child: Center(
                  child: Text(
                    'Image novel app $i',
                    style: const TextStyle(fontSize: 16.0),
                  ),
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
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const DrawerHeader(
              child: Column(
            children: [
              Text("Narrative"),
              Text("lorem ipsum dolor sit amet"),
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: () {
                      Navigator.pushNamed(context, '/profilscreen');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text('Favorite'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.library_books),
                    title: const Text('Books'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text('Genre'),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
