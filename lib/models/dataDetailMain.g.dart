part of 'dataDetailMain.dart';

DataDetailMain _$DataDetailMainFromJson(Map<String, dynamic> json) {
  return DataDetailMain(
      json['IsSuccess'] as bool?,
      json['Data'] == null
          ? null
          : ProductDetailForItem.fromJson(json['Data'] as Map<String, dynamic>),
      json['Message'] as String?);
}

Map<String, dynamic> _$DataDetailMainToJson(DataDetailMain instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
