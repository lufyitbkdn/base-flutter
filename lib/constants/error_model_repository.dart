import 'package:json_annotation/json_annotation.dart';
part '../core/model/error_model_repository.g.dart';

// To clear this error you should run the following commands
// flutter clean
// flutter packages pub get
// flutter pub run build_runner build --delete-conflicting-outputs
// refer - https://pub.dev/packages/build_runner

@JsonSerializable()
class ErrorModel {
  ErrorModel({
    this.statusCode,
    this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  int? statusCode;
  String? message;
}
