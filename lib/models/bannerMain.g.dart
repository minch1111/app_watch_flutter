part of 'bannerMain.dart';

BannerMain _$BannerMainFromJson(Map<String, dynamic> json) {
  return BannerMain(
      json['IsSuccess'] as bool?,
      (json['Data'] as List<dynamic>?)?.map((e) => Banner.fromJson(e as Map<String,dynamic>)).toList(),
      json['Message'] as String?);
}

Map<String, dynamic> _$BannerMainToJson(BannerMain instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
