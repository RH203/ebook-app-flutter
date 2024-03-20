import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:novel_app/src/utils/button/genre_utils.dart';
import 'package:novel_app/src/utils/validator/validator.dart';
import 'package:provider/provider.dart';
import 'package:novel_app/src/provider/theme/provider_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  GenreUtils _genreUtils = GenreUtils();
  void isChangeTheme() {
    setState(() {
      Provider.of<ProviderTheme>(context, listen: false).toggleTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Consumer<ProviderTheme>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(OctIcons.arrow_left),
            onPressed: () => Navigator.popAndPushNamed(context, '/mainscreen'),
          ),
          actions: [
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
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                _SearchBarCustom(searchController: searchController),
                _TextTopSearch(),
                GridView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  children: _genreUtils.genreTitle
                      .map(
                        (e) => ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(e),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextTopSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Text(
        "Search by genre.",
        style: TextStyle(fontSize: 25),
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
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, left: 2, right: 2, bottom: 12),
      child: TextFormField(
        controller: searchController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(IonIcons.search),
          ),
          hintText: "Search",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
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
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter the title of the book. ";
          }
          if (Validator.searchIsValid(value)) {
            return "Invalid title";
          }
          return "null";
        },
      ),
    );
  }
}
