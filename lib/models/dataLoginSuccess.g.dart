part of 'dataLoginSuccess.dart';

DataLoginSuccess _$DataLoginSuccessFromJson(Map<String, dynamic> json) {
  return DataLoginSuccess(
      json['IsSuccess'] as bool?,
      json['Data'] == null
          ? null
          : DataDetailLoginSuccess.fromJson(json['Data'] as Map<String, dynamic>),
      json['Message'] as String?);
}

Map<String, dynamic> _$DataLoginSuccessToJson(DataLoginSuccess instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
