class WelcomeUtils {
  final imageWelcome = [
    "assets/image/homescreen/women-smartphone.jpg",
    "assets/image/homescreen/man-smartphone.jpg",
    "assets/image/homescreen/women-smartphone-2.jpg",
  ];

  final titleWelcome = [
    "Explore Vast Narratives: NarrativeNet",
    "Unlock the World of Stories: NarrativeNet",
    "Immerse Yourself in Infinite Adventures: NarrativeNet"
  ];
  final descriptionWelcome = [
    "Embark on a literary journey through a diverse collection of captivating ebooks, awaiting your discovery.",
    "Dive into a realm where imagination knows no bounds, as NarrativeNet brings you an expansive array of tales to explore.",
    "Let NarrativeNet be your gateway to endless realms of wonder, where every story invites you to escape reality and explore new horizons."
  ];

  List<String> dataScreen(int index) {
    return [
      imageWelcome[index],
      titleWelcome[index],
      descriptionWelcome[index]
    ];
  }
}
