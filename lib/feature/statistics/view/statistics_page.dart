import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  // final List<String> selectedMoods;
  // final List<String> selectedSubOptions;

  const StatisticsPage({
    super.key,
    // required this.selectedMoods,
    // required this.selectedSubOptions,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Избранные настроения:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4C4C69),
              ),
            ),
            SizedBox(height: 10),
            // for (var mood in selectedMoods)
            //   Text(
            //     mood,
            //     style: const TextStyle(
            //       fontSize: 14,
            //       color: Colors.black,
            //     ),
            //   ),
            SizedBox(height: 20),
            Text(
              'Выбранные подопции:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4C4C69),
              ),
            ),
            // const SizedBox(height: 10),
            // for (var subOption in selectedSubOptions)
            //   Text(
            //     subOption,
            //     style: const TextStyle(
            //       fontSize: 14,
            //       color: Colors.black,
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
