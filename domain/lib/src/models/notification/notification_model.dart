part of '../base_model.dart';

@JsonSerializable()
@CopyWith()
class NotificationModel extends BaseModel {
  final String id;
  final String key;
  final String subject;
  final Map<String, dynamic>? metadata;
  final bool isSeen;

  NotificationModel({
    required this.id,
    required this.key,
    required this.subject,
    required this.metadata,
    required this.isSeen,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
