// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TestModelCWProxy {
  TestModel message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TestModel call({
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTestModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTestModel.copyWith.fieldName(...)`
class _$TestModelCWProxyImpl implements _$TestModelCWProxy {
  const _$TestModelCWProxyImpl(this._value);

  final TestModel _value;

  @override
  TestModel message(String message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TestModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TestModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TestModel call({
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return TestModel(
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $TestModelCopyWith on TestModel {
  /// Returns a callable class that can be used as follows: `instanceOfTestModel.copyWith(...)` or like so:`instanceOfTestModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TestModelCWProxy get copyWith => _$TestModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) => TestModel(
      message: json['message'] as String,
    );

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'message': instance.message,
    };
