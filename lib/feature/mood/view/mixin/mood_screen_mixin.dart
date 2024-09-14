// ignore_for_file: avoid_shadowing_type_parameters
import 'package:flutter/material.dart';
import '../../../../product/core/constants/app_constants.dart';
import '../../../../product/core/utils/date_time_utils.dart';

mixin MoodScreenMixin<T extends StatefulWidget> on State<T> {
  final TextEditingController _noteController = TextEditingController();
  final Set<String> _selectedMoods = {};
  final Set<String> _selectedSubOptions = {};
  double _sliderValue1 = 50.0;
  double _sliderValue2 = 50.0;
  bool _isDraggingSlider1 = false;
  bool _isDraggingSlider2 = false;

  TextEditingController get noteController => _noteController;
  Set<String> get selectedMoods => _selectedMoods;
  Set<String> get selectedSubOptions => _selectedSubOptions;
  double get sliderValue1 => _sliderValue1;
  double get sliderValue2 => _sliderValue2;
  bool get isDraggingSlider1 => _isDraggingSlider1;
  bool get isDraggingSlider2 => _isDraggingSlider2;

  void handleSelection<T>(Set<T> selectedItems, T item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  void handleMoodSelection(String mood) {
    handleSelection(_selectedMoods, mood);
  }

  void handleSubOptionSelection(String subOption) {
    handleSelection(_selectedSubOptions, subOption);
  }

  void handleSlider1Change(double value) {
    setState(() {
      _sliderValue1 = value;
      _isDraggingSlider1 = true;
    });
  }

  void handleSlider2Change(double value) {
    setState(() {
      _sliderValue2 = value;
      _isDraggingSlider2 = true;
    });
  }

  bool isFormValid() {
    return _selectedMoods.isNotEmpty &&
        _noteController.text.trim().isNotEmpty &&
        _sliderValue1.isInRange(0, 100) &&
        _sliderValue2.isInRange(0, 100);
  }

  void submitMood(BuildContext context) {
    final noteText = _noteController.text.trim();
    final getFormattedDateTime = DateTimeUtils.getFormattedDateTime();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.success),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Дата и время: $getFormattedDateTime'),
              Text('Выбранные настроения: ${_selectedMoods.join(', ')}'),
              Text('Выбранные подопции: ${_selectedSubOptions.join(', ')}'),
              Text('Уровень стресса: ${_sliderValue1.toStringAsFixed(1)}'),
              Text('Самооценка: ${_sliderValue2.toStringAsFixed(1)}'),
              Text('Заметки: $noteText'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(AppStrings.ok),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
}

extension on double {
  bool isInRange(double min, double max) => this >= min && this <= max;
}
