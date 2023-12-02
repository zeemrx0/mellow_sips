part of '../base_raw.dart';

@JsonSerializable()
@CopyWith()
class NotificationRaw extends BaseRaw {
  final String id;
  final String key;
  final String subject;
  final Map<String, dynamic>? metadata;
  final bool isSeen;

  NotificationRaw({
    required this.id,
    required this.key,
    required this.subject,
    required this.metadata,
    required this.isSeen,
  });

  factory NotificationRaw.fromJson(Map<String, dynamic> json) =>
      _$NotificationRawFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationRawToJson(this);

  @override
  BaseModel toModel() {
    return NotificationModel(
      id: id,
      key: key,
      subject: subject,
      metadata: metadata,
      isSeen: isSeen,
    );
  }
}
