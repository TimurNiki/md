import 'package:flutter/material.dart';
import 'package:myapp/product/core/constants/app_constants.dart';

class NotesField extends StatelessWidget {
  final TextEditingController controller;

  const NotesField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
         AppStrings.notes,
          style: TextStyles.labelTextStyle
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: AppStrings.enterNote,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          maxLines: 4,
        ),
      ],
    );
  }
}
