part of 'brand.dart';

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
    json['Id'] as String?,
    json['CategoryId'] as String?,
    json['Name'] as String?,
    json['IsShow'] as int?,
    json['ImageBrand'] as String?,
    json['CreatedByName'] as String?,
    json['CreatedByTime'] as String?,
    json['CreatedByID'] as String?,
    json['UpdatedByName'] as String?,
    json['UpdatedByTime'] as String?,
    json['UpdatedByID'] as String?,
  );
}

Map<String, dynamic> _$BrandToJson(Brand instance) =>
    <String, dynamic>{
      "Id": instance.Id,
      "CategoryId": instance.CategoryId,
      "Name": instance.Name,
      "IsShow": instance.IsShow,
      "ImageBrand": instance.ImageBrand,
      "CreatedByName": instance.CreatedByName,
      "CreatedByTime": instance.CreatedByTime,
      "CreatedByID": instance.CreatedByID,
      "UpdatedByName": instance.UpdatedByName,
      "UpdatedByTime": instance.UpdatedByTime,
      "UpdatedByID": instance.UpdatedByID,
    };