import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/settings.dart';
import '../../../core/database/hive_boxes.dart';

final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, Settings>((ref) {
      return SettingsViewModel();
    });

class SettingsViewModel extends StateNotifier<Settings> {
  static const String _boxName = 'settings';
  late Box<Map<String, dynamic>> _box;

  SettingsViewModel() : super(Settings.defaultSettings()) {
    _init();
  }

  Future<void> _init() async {
    _box = HiveBoxes.getSettingsBox();
    await _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final data = _box.get('settings');
      if (data != null) {
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

  Future<void> clearAllData() async {
    try {
      await _box.clear();
      await HiveBoxes.getFavoritesBox().clear();
      state = Settings.defaultSettings();
    } catch (e) {
      // Hata durumunda log yazılabilir
    }
  }
}
