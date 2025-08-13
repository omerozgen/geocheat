import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/settings_viewmodel.dart';
import '../widgets/settings_tile.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsViewModelProvider);
    final viewModel = ref.read(settingsViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('settings.title'.tr()), elevation: 0.5),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: settings.isDarkMode
                ? [const Color(0xFF2d2d2d), const Color(0xFF1a1a1a)]
                : [const Color(0xFFe3f0ff), const Color(0xFFf6f8fb)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SettingsTile(
                    title: 'settings.dark_mode'.tr(),
                    subtitle: 'settings.dark_mode.subtitle'.tr(),
                    icon: Icons.dark_mode,
                    trailing: Switch(
                      value: settings.isDarkMode,
                      onChanged: (value) => viewModel.toggleDarkMode(),
                    ),
                  ),
                  const Divider(height: 1),
                  SettingsTile(
                    title: 'settings.language'.tr(),
                    subtitle: 'settings.language.subtitle'.tr(),
                    icon: Icons.language,
                    trailing: DropdownButton<Locale>(
                      value: context.locale,
                      underline: const SizedBox.shrink(),
                      onChanged: (loc) async {
                        if (loc != null) {
                          await context.setLocale(loc);
                          await viewModel.setLanguage(loc);
                        }
                      },
                      items: [
                        DropdownMenuItem(
                          value: const Locale('tr'),
                          child: Text('settings.language.tr'.tr()),
                        ),
                        DropdownMenuItem(
                          value: const Locale('en'),
                          child: Text('settings.language.en'.tr()),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  SettingsTile(
                    title: 'settings.notifications'.tr(),
                    subtitle: 'settings.notifications.subtitle'.tr(),
                    icon: Icons.notifications,
                    trailing: Switch(
                      value: settings.notificationsEnabled,
                      onChanged: (value) => viewModel.toggleNotifications(),
                    ),
                  ),
                  const Divider(height: 1),
                  SettingsTile(
                    title: 'settings.autosave'.tr(),
                    subtitle: 'settings.autosave.subtitle'.tr(),
                    icon: Icons.save,
                    trailing: Switch(
                      value: settings.autoSave,
                      onChanged: (value) => viewModel.toggleAutoSave(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SettingsTile(
                    title: 'settings.about'.tr(),
                    subtitle: 'settings.about.subtitle'.tr(),
                    icon: Icons.info,
                    onTap: () => _showAboutDialog(context),
                  ),
                  const Divider(height: 1),
                  SettingsTile(
                    title: 'settings.clear'.tr(),
                    subtitle: 'settings.clear.subtitle'.tr(),
                    icon: Icons.delete_forever,
                    onTap: () => _showClearDataDialog(context, viewModel),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'GeoCheat',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.school, size: 48),
      children: [
        const Text(
          'Geometri formüllerini öğrenmek için geliştirilmiş bir uygulamadır.',
        ),
        const SizedBox(height: 16),
        const Text('© 2024 GeoCheat Team'),
      ],
    );
  }

  void _showClearDataDialog(BuildContext context, SettingsViewModel viewModel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Verileri Temizle'),
        content: const Text(
          'Tüm yerel veriler (favoriler, ayarlar) silinecek. Bu işlem geri alınamaz.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              viewModel.clearAllData();
              Navigator.of(context).pop();
            },
            child: const Text('Temizle', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
