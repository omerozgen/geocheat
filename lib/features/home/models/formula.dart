import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'formula.freezed.dart';
part 'formula.g.dart';

@freezed
@HiveType(typeId: 0)
class Formula with _$Formula {
  const factory Formula({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required String formulaText,
    @HiveField(4) String? imagePath,
    @HiveField(5) required String categoryId,
    @HiveField(6) required bool isFavorited,
  }) = _Formula;
}
