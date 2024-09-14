import 'package:flutter/material.dart';
import 'package:myapp/product/core/constants/app_constants.dart';

class SubmitButton extends StatelessWidget {
  final bool isFormValid;
  final VoidCallback onPressed;

  const SubmitButton({
    super.key,
    required this.isFormValid,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isFormValid ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isFormValid ? Colors.orange : Colors.grey,
          ),
          child: const Text(
            AppStrings.save,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
