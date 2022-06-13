part of 'dataProductAll.dart';

DataProductAll _$DataProductAllFromJson(Map<String, dynamic> json) {
  return DataProductAll(
    json['PageIndex'] as int?,
    json['PageSize'] as int?,
    (json['ListProduct'] as List<dynamic>?)?.map((e) => ProductDetail.fromJson(e as Map<String,dynamic>)).toList(),
  );
}

Map<String, dynamic> _$DataProductAllToJson(DataProductAll instance) =>
    <String, dynamic>{
      "PageIndex": instance.PageSize,
      "PageSize": instance.PageSize,
      "ListProduct": instance.ListProduct,
    };