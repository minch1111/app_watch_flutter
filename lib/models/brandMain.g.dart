part of 'brandMain.dart';

BrandMain _$BrandMainFromJson(Map<String, dynamic> json) {
  return BrandMain(
      json['IsSuccess'] as bool?,
      (json['Data'] as List<dynamic>?)?.map((e) => Brand.fromJson(e as Map<String,dynamic>)).toList(),
      json['Message'] as String?);
}

Map<String, dynamic> _$BrandMainToJson(BrandMain instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
