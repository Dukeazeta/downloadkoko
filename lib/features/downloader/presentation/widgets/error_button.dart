import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_button.dart';

class ErrorButton extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorButton({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Error: Try Again',
      onPressed: onRetry,
      isError: true,
    );
  }
}
