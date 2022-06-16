part of 'categoryMain.dart';

CategoryMain _$CategoryMainFromJson(Map<String, dynamic> json) {
  return CategoryMain(
      json['IsSuccess'] as bool?,
      (json['Data'] as List<dynamic>?)?.map((e) => Category.fromJson(e as Map<String,dynamic>)).toList(),
      json['Message'] as String?);
}

Map<String, dynamic> _$CategoryMainToJson(CategoryMain instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
