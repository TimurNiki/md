import 'package:myapp/product/core/constants/app_constants.dart';

 class MoodLists {
  final String mood;
  final String imagePath;

  MoodLists({required this.mood, required this.imagePath});

  static final List<MoodLists> moods = [
    MoodLists(
        mood: AppStrings.happiness, imagePath: 'assets/images/happiness.png'),
    MoodLists(mood: AppStrings.fear, imagePath: 'assets/images/fear.png'),
    MoodLists(mood: AppStrings.madness, imagePath: 'assets/images/madness.png'),
    MoodLists(mood: AppStrings.sadness, imagePath: 'assets/images/sadness.png'),
    MoodLists(
        mood: AppStrings.calmness, imagePath: 'assets/images/calmness.png'),
    MoodLists(
        mood: AppStrings.strength, imagePath: 'assets/images/strength.png'),
  ];
 
}
