// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_raw.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TestRawCWProxy {
  TestRaw message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestRaw(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestRaw(...).copyWith(id: 12, name: "My name")
  /// ````
  TestRaw call({
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTestRaw.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTestRaw.copyWith.fieldName(...)`
class _$TestRawCWProxyImpl implements _$TestRawCWProxy {
  const _$TestRawCWProxyImpl(this._value);

  final TestRaw _value;

  @override
  TestRaw message(String message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestRaw(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestRaw(...).copyWith(id: 12, name: "My name")
  /// ````
  TestRaw call({
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return TestRaw(
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $TestRawCopyWith on TestRaw {
  /// Returns a callable class that can be used as follows: `instanceOfTestRaw.copyWith(...)` or like so:`instanceOfTestRaw.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TestRawCWProxy get copyWith => _$TestRawCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestRaw _$TestRawFromJson(Map<String, dynamic> json) => TestRaw(
      message: json['message'] as String,
    );

Map<String, dynamic> _$TestRawToJson(TestRaw instance) => <String, dynamic>{
      'message': instance.message,
    };
