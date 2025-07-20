// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formula.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormulaAdapter extends TypeAdapter<Formula> {
  @override
  final int typeId = 0;

  @override
  Formula read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Formula(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      formulaText: fields[3] as String,
      imagePath: fields[4] as String?,
      categoryId: fields[5] as String,
      isFavorited: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Formula obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.formulaText)
      ..writeByte(4)
      ..write(obj.imagePath)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.isFavorited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormulaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
