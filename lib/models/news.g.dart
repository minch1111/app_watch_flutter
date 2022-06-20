part of 'news.dart';

Blog _$BlogFromJson(Map<String, dynamic> json) {
  return Blog(
    json["Id"] as String?,
    json["Title"] as String?,
    json["Author"] as String?,
    json["Content"] as String?,
    json["Thumbnail"] as String?,
    json["IsShow"] as int?,
    json["CreatedByName"] as String?,
    json["CreatedByTime"] as String?,
    json["CreatedByID"] as String?,
    json["UpdatedByName"] as String?,
    json["UpdatedByTime"] as String?,
    json["UpdatedByID"] as String?,
  );
}

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      "Id": instance.Id,
      "Title": instance.Title,
      "Author": instance.Author,
      "Content": instance.Content,
      "Thumbnail": instance.Thumbnail,
      "IsShow": instance.IsShow,
      "CreatedByName": instance.CreatedByName,
      "CreatedByTime": instance.CreatedByTime,
      "CreatedByID": instance.CreatedByID,
      "UpdatedByName": instance.UpdatedByName,
      "UpdatedByTime": instance.UpdatedByTime,
      "UpdatedByID": instance.UpdatedByID,
    };
