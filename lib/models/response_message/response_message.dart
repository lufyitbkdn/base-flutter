import 'package:json_annotation/json_annotation.dart';
import 'package:mywo/core/core.dart';

part 'response_message.g.dart';

@JsonSerializable()
class ResponseMessage extends IBaseModel<ResponseMessage> {
  ResponseMessage({
    this.message,
    this.success = false,
  });

  factory ResponseMessage.fromJson(Map<String, dynamic> json) =>
      _$ResponseMessageFromJson(json);
  String? message;
  bool success;

  @override
  Map<String, dynamic> toJson() => _$ResponseMessageToJson(this);

  @override
  ResponseMessage fromJson(Map<String, dynamic> json) =>
      _$ResponseMessageFromJson(json);
}
