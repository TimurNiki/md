import 'package:flutter/material.dart';
import 'package:myapp/product/core/lists/mood_lists.dart';

class MoodSelector extends StatelessWidget {
  final Set<String> selectedMoods;
  final ValueChanged<String> onMoodSelected;

  const MoodSelector({
    super.key,
    required this.selectedMoods,
    required this.onMoodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: MoodLists.moods.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final mood = MoodLists.moods[index];
          final isSelected = selectedMoods.contains(mood.mood);

          return GestureDetector(
            onTap: () => onMoodSelected(mood.mood),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Container(
                width: 83,
                height: 118,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isSelected ? Colors.orange : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      mood.imagePath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      mood.mood,
                      style: const TextStyle(
                        color: Color(0xFF4C4C69),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
