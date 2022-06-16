part of 'category.dart';

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['Id'] as String?,
    json['Name'] as String?,
    json['IsShow'] as int?,
    json['ImageCategory'] as String?,
    json['CreatedByName'] as String?,
    json['CreatedByTime'] as String?,
    json['CreatedByID'] as String?,
    json['UpdatedByName'] as String?,
    json['UpdatedByTime'] as String?,
    json['UpdatedByID'] as String?,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) =>
    <String, dynamic>{
      "Id": instance.Id,
      "Name": instance.Name,
      "IsShow": instance.IsShow,
      "ImageCategory": instance.ImageCategory,
      "CreatedByName": instance.CreatedByName,
      "CreatedByTime": instance.CreatedByTime,
      "CreatedByID": instance.CreatedByID,
      "UpdatedByName": instance.UpdatedByName,
      "UpdatedByTime": instance.UpdatedByTime,
      "UpdatedByID": instance.UpdatedByID,
    };