import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:downloadkoko/config/constants/app_constants.dart';
import '../widgets/download_list.dart';
import '../widgets/paste_url_card.dart';
import '../../../settings/presentation/screens/settings_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'downloadkoko',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontFamily: 'KokoFont',
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ).animate().fadeIn().slideX(),
                        IconButton(
                          icon: Icon(
                            Icons.settings_outlined,
                            color: theme.colorScheme.primary,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                        ).animate().fadeIn(),
                      ],
                    ),
                    const Spacer(),
                    const PasteUrlCard()
                      .animate()
                      .fadeIn(delay: 300.ms)
                      .slideY(begin: 0.3, end: 0),
                    const SizedBox(height: AppConstants.defaultSpacing * 3),
                    const DownloadList()
                      .animate()
                      .fadeIn(delay: 600.ms)
                      .slideY(begin: 0.3, end: 0),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
