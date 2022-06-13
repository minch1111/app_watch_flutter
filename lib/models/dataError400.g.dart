part of 'dataError400.dart';

DataError400 _$DataError400FromJson(Map<String, dynamic> json) {
  return DataError400(
      json['IsSuccess'] as bool?,
      json['Data'] as String?,
      json['Message'] as String?);
}

Map<String, dynamic> _$DataError400ToJson(DataError400 instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
