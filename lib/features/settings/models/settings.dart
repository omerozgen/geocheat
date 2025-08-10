import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
@HiveType(typeId: 2)
class Settings with _$Settings {
  const factory Settings({
    @HiveField(0) @Default(false) bool isDarkMode,
    @HiveField(1) @Default(true) bool notificationsEnabled,
    @HiveField(2) @Default(true) bool autoSave,
  }) = _Settings;

  factory Settings.defaultSettings() => const Settings();
}
