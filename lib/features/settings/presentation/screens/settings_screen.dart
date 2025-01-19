import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          const _SettingsSection(
            title: 'Download Settings',
            children: [
              _SettingsTile(
                title: 'Download Location',
                subtitle: 'Choose where to save downloads',
                icon: Icons.folder,
              ),
              _SettingsTile(
                title: 'Video Quality',
                subtitle: 'Select preferred video quality',
                icon: Icons.high_quality,
              ),
              _SettingsTile(
                title: 'Audio Format',
                subtitle: 'Choose audio format for music',
                icon: Icons.music_note,
              ),
            ],
          ),
          _SettingsSection(
            title: 'App Settings',
            children: [
              _SettingsTile(
                title: 'Dark Mode',
                subtitle: 'Toggle dark/light theme',
                icon: Icons.dark_mode,
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (_) {
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                ),
              ),
              const _SettingsTile(
                title: 'Notifications',
                subtitle: 'Manage download notifications',
                icon: Icons.notifications,
              ),
            ],
          ),
          const _SettingsSection(
            title: 'About',
            children: [
              _SettingsTile(
                title: 'Version',
                subtitle: '1.0.0',
                icon: Icons.info,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...children,
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? trailing;

  const _SettingsTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: () {
        // TODO: Implement settings actions
      },
    );
  }
}
