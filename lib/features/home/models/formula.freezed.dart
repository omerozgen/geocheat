// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formula.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Formula {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String get formulaText => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get imagePath => throw _privateConstructorUsedError;
  @HiveField(5)
  String get categoryId => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get isFavorited => throw _privateConstructorUsedError;

  /// Create a copy of Formula
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormulaCopyWith<Formula> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormulaCopyWith<$Res> {
  factory $FormulaCopyWith(Formula value, $Res Function(Formula) then) =
      _$FormulaCopyWithImpl<$Res, Formula>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) String formulaText,
      @HiveField(4) String? imagePath,
      @HiveField(5) String categoryId,
      @HiveField(6) bool isFavorited});
}

/// @nodoc
class _$FormulaCopyWithImpl<$Res, $Val extends Formula>
    implements $FormulaCopyWith<$Res> {
  _$FormulaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Formula
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? formulaText = null,
    Object? imagePath = freezed,
    Object? categoryId = null,
    Object? isFavorited = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      formulaText: null == formulaText
          ? _value.formulaText
          : formulaText // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormulaImplCopyWith<$Res> implements $FormulaCopyWith<$Res> {
  factory _$$FormulaImplCopyWith(
          _$FormulaImpl value, $Res Function(_$FormulaImpl) then) =
      __$$FormulaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) String description,
      @HiveField(3) String formulaText,
      @HiveField(4) String? imagePath,
      @HiveField(5) String categoryId,
      @HiveField(6) bool isFavorited});
}

/// @nodoc
class __$$FormulaImplCopyWithImpl<$Res>
    extends _$FormulaCopyWithImpl<$Res, _$FormulaImpl>
    implements _$$FormulaImplCopyWith<$Res> {
  __$$FormulaImplCopyWithImpl(
      _$FormulaImpl _value, $Res Function(_$FormulaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Formula
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? formulaText = null,
    Object? imagePath = freezed,
    Object? categoryId = null,
    Object? isFavorited = null,
  }) {
    return _then(_$FormulaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      formulaText: null == formulaText
          ? _value.formulaText
          : formulaText // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorited: null == isFavorited
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FormulaImpl implements _Formula {
  const _$FormulaImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.description,
      @HiveField(3) required this.formulaText,
      @HiveField(4) this.imagePath,
      @HiveField(5) required this.categoryId,
      @HiveField(6) required this.isFavorited});

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final String formulaText;
  @override
  @HiveField(4)
  final String? imagePath;
  @override
  @HiveField(5)
  final String categoryId;
  @override
  @HiveField(6)
  final bool isFavorited;

  @override
  String toString() {
    return 'Formula(id: $id, title: $title, description: $description, formulaText: $formulaText, imagePath: $imagePath, categoryId: $categoryId, isFavorited: $isFavorited)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormulaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.formulaText, formulaText) ||
                other.formulaText == formulaText) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isFavorited, isFavorited) ||
                other.isFavorited == isFavorited));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      formulaText, imagePath, categoryId, isFavorited);

  /// Create a copy of Formula
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormulaImplCopyWith<_$FormulaImpl> get copyWith =>
      __$$FormulaImplCopyWithImpl<_$FormulaImpl>(this, _$identity);
}

abstract class _Formula implements Formula {
  const factory _Formula(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) required final String description,
      @HiveField(3) required final String formulaText,
      @HiveField(4) final String? imagePath,
      @HiveField(5) required final String categoryId,
      @HiveField(6) required final bool isFavorited}) = _$FormulaImpl;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  String get formulaText;
  @override
  @HiveField(4)
  String? get imagePath;
  @override
  @HiveField(5)
  String get categoryId;
  @override
  @HiveField(6)
  bool get isFavorited;

  /// Create a copy of Formula
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormulaImplCopyWith<_$FormulaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
