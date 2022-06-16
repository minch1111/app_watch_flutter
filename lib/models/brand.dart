import 'package:json_annotation/json_annotation.dart';
part 'brand.g.dart';

@JsonSerializable()
class Brand {
  String? Id;
  String? CategoryId;
  String? Name;
  int? IsShow;
  String? ImageBrand;
  String? CreatedByName;
  String? CreatedByTime;
  String? CreatedByID;
  String? UpdatedByName;
  String? UpdatedByTime;
  String? UpdatedByID;

  Brand(
      this.Id,
      this.CategoryId,
      this.Name,
      this.IsShow,
      this.ImageBrand,
      this.CreatedByName,
      this.CreatedByTime,
      this.CreatedByID,
      this.UpdatedByID,
      this.UpdatedByName,
      this.UpdatedByTime);

  factory Brand.fromJson(Map<String, dynamic> json) =>
      _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}