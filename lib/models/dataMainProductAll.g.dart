part of 'dataMainProductAll.dart';

DataMainProductAll _$DataMainProductAllFromJson(Map<String, dynamic> json) {
  return DataMainProductAll(
      json['IsSuccess'] as bool?,
      json['Data'] == null
          ? null
          : DataProductAll.fromJson(json['Data'] as Map<String, dynamic>),
      json['Message'] as String?);
}

Map<String, dynamic> _$DataMainProductAllToJson(DataMainProductAll instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
