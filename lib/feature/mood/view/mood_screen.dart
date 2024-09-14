// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myapp/product/core/constants/app_constants.dart';

import '../widgets/mood_widgets_import.dart';
import 'mixin/mood_screen_mixin.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen>
    with MoodScreenMixin<MoodScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppStrings.howDoYouFeel, style: TextStyles.labelTextStyle),
          const CustomSizedbox(),
          MoodSelector(
            selectedMoods: selectedMoods,
            onMoodSelected: handleMoodSelection,
          ),
          if (selectedMoods.isNotEmpty) ...[
            SubOptionsSelector(
              selectedMoods: selectedMoods,
              selectedSubOptions: selectedSubOptions,
              onSubOptionSelected: handleSubOptionSelection,
            ),
          ],
          const CustomSizedbox(),
          const Text(AppStrings.stressLevel, style: TextStyles.labelTextStyle),
          CustomSlider(
              value: sliderValue1,
              leftLabel: AppStrings.low,
              rightLabel: AppStrings.high,
              onChanged: handleSlider1Change,
              isDragging: isDraggingSlider1),
          const CustomSizedbox(),
          const Text(AppStrings.selfesteem, style: TextStyles.labelTextStyle),
          CustomSlider(
            value: sliderValue2,
            leftLabel: AppStrings.unconfidence,
            rightLabel: AppStrings.confidence,
            onChanged: handleSlider2Change,
            isDragging: isDraggingSlider2,
          ),
          const CustomSizedbox(),
          NotesField(controller: noteController),
          const CustomSizedbox(),
          SubmitButton(
            isFormValid: isFormValid(),
            onPressed: () => submitMood(context),
          ),
        ],
      ),
    );
  }
}
