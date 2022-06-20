part of 'newsMain.dart';

NewsMain _$NewsMainFromJson(Map<String, dynamic> json) {
  return NewsMain(
      json['IsSuccess'] as bool?,
      json['Data'] == null ? null : (json['Data'] as List<dynamic>?)?.map((e) => Blog.fromJson(e as Map<String,dynamic>)).toList(),
      json['Message'] as String?);
}

Map<String, dynamic> _$NewsMainToJson(NewsMain instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
