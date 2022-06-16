import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  String? Id;
  String? Name;
  int? IsShow;
  String? ImageCategory;
  String? CreatedByName;
  String? CreatedByTime;
  String? CreatedByID;
  String? UpdatedByName;
  String? UpdatedByTime;
  String? UpdatedByID;

  Category(
      this.Id,
      this.Name,
      this.IsShow,
      this.ImageCategory,
      this.CreatedByName,
      this.CreatedByTime,
      this.CreatedByID,
      this.UpdatedByID,
      this.UpdatedByName,
      this.UpdatedByTime);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}