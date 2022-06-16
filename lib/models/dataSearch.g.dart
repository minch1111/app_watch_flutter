part of 'dataSearch.dart';

DataSearch _$DataSearchFromJson(Map<String, dynamic> json) {
  return DataSearch(
      json['IsSuccess'] as bool?,
      (json['Data'] as List<dynamic>?)?.map((e) => ProductDetail.fromJson(e as Map<String,dynamic>)).toList(),
      json['Message'] as String?);
}

Map<String, dynamic> _$DataSearchToJson(DataSearch instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
