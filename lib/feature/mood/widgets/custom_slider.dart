import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final String leftLabel;
  final String rightLabel;
  final ValueChanged<double> onChanged;
  final bool isDragging;
  static const double _min = 0.0;
  static const double _max = 100.0;
  static const int _divisions = 6;

  const CustomSlider({
    super.key,
    required this.value,
    required this.leftLabel,
    required this.rightLabel,
    required this.onChanged,
    required this.isDragging,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slider(
          activeColor: isDragging ? Colors.orange : Colors.grey,
          inactiveColor: Colors.grey,
          value: value,
          min: _min,
          max: _max,
          divisions: _divisions,
          onChanged: onChanged,
          onChangeStart: (_) {
            // Change color to orange when dragging starts
            (context as Element).markNeedsBuild();
          },
          onChangeEnd: (_) {
            // Change color back to grey when dragging ends
            (context as Element).markNeedsBuild();
          },
        ),
        _buildSliderLabels(leftLabel, rightLabel),
      ],
    );
  }

  Widget _buildSliderLabels(String leftLabel, String rightLabel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftLabel, style: const TextStyle(fontSize: 12)),
        Text(rightLabel, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
