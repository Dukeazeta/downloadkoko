import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:downloadkoko/config/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool isError;
  final bool isOutlined;
  final bool isSmall;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isError = false,
    this.isOutlined = false,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final button = isOutlined
        ? OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: isSmall
                ? theme.outlinedButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size.zero),
                  )
                : null,
            child: _buildButtonContent(theme),
          )
        : ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: isSmall
                ? theme.elevatedButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size.zero),
                  )
                : null,
            child: _buildButtonContent(theme),
          );

    return button.animate().fadeIn().scale();
  }

  Widget _buildButtonContent(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                isOutlined ? theme.colorScheme.primary : Colors.white,
              ),
            ),
          ),
          const SizedBox(width: AppConstants.defaultSpacing),
        ] else if (icon != null) ...[
          Icon(icon, size: isSmall ? 16 : 20),
          const SizedBox(width: AppConstants.defaultSpacing),
        ],
        Text(
          text,
          style: (isSmall 
              ? theme.textTheme.labelMedium 
              : theme.textTheme.labelLarge)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
