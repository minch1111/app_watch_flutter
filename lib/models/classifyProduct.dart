import 'package:json_annotation/json_annotation.dart';
part 'classifyProduct.g.dart';

@JsonSerializable()
class ClassifyProduct {
  String? Id;
  String? ProductId;
  String? Image;
  String? Name;
  int? OriginalPrice;
  int? PromotionPrice;
  int? Stock;
  int? IsShow;
  String? CreatedByName;
  String? CreatedByTime;
  String? CreatedByID;
  String? UpdatedByName;
  String? UpdatedByTime;
  String? UpdatedByID;

  ClassifyProduct(
      this.Id,
      this.ProductId,
      this.Image,
      this.Name,
      this.OriginalPrice,
      this.PromotionPrice,
      this.Stock,
      this.IsShow,
      this.CreatedByName,
      this.CreatedByTime,
      this.CreatedByID,
      this.UpdatedByID,
      this.UpdatedByName,
      this.UpdatedByTime);

  factory ClassifyProduct.fromJson(Map<String, dynamic> json) =>
      _$ClassifyProductFromJson(json);

  Map<String, dynamic> toJson() => _$ClassifyProductToJson(this);
}
