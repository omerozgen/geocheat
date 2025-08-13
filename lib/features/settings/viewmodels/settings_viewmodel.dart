import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:hive_flutter/hive_flutter.dart';
import '../models/settings.dart';
import '../../../core/database/hive_boxes.dart';

final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, Settings>((ref) {
      return SettingsViewModel();
    });

class SettingsViewModel extends StateNotifier<Settings> {
  static const String _boxName = 'settings';
  late Box _box;

  SettingsViewModel() : super(Settings.defaultSettings()) {
    _init();
  }

  Future<void> _init() async {
    _box = HiveBoxes.getSettingsBox();
    await _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final dynamic raw = _box.get('settings');
      if (raw != null && raw is Map) {
        final data = Map<String, dynamic>.from(raw as Map);
        // Hive'dan gelen veriyi Settings'e dönüştür
        state = Settings(
          isDarkMode: data['isDarkMode'] ?? false,
          notificationsEnabled: data['notificationsEnabled'] ?? true,
          autoSave: data['autoSave'] ?? true,
        );
      }
    } catch (e) {
      // Hata durumunda default ayarları kullan
      state = Settings.defaultSettings();
    }
  }

  Future<void> _saveSettings() async {
    try {
      await _box.put('settings', {
        'isDarkMode': state.isDarkMode,
        'notificationsEnabled': state.notificationsEnabled,
        'autoSave': state.autoSave,
        'languageCode': (_box.get('settings') is Map)
            ? (_box.get('settings')['languageCode'])
            : null,
      });
    } catch (e) {
      // Hata durumunda log yazılabilir
    }
  }

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
    _saveSettings();
  }

  void toggleNotifications() {
    state = state.copyWith(notificationsEnabled: !state.notificationsEnabled);
    _saveSettings();
  }

  void toggleAutoSave() {
    state = state.copyWith(autoSave: !state.autoSave);
    _saveSettings();
  }

  Future<void> setLanguage(Locale locale) async {
    try {
      final current = _box.get('settings') ?? {};
      current['languageCode'] = locale.languageCode;
      await _box.put('settings', Map<String, dynamic>.from(current));
    } catch (e) {
      // ignore
    }
  }

  Future<void> clearAllData() async {
    try {
      await _box.clear();
      await HiveBoxes.getFavoritesListBox().clear();
      state = Settings.defaultSettings();
    } catch (e) {
      // Hata durumunda log yazılabilir
    }
  }
}
