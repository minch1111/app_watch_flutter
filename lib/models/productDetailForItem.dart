import 'package:example_flutter/models/classifyProduct.dart';
import 'package:json_annotation/json_annotation.dart';
part 'productDetailForItem.g.dart';

@JsonSerializable()
class ProductDetailForItem {
  String? Id;
  String? Ablert;
  String? BrandId;
  String? BrandName;
  String? CategoryId;
  String? CategoryName;
  String? Crystal;
  List<ClassifyProduct>? ClassifyProducts;
  String? Description;
  int? FromPrice;
  List<String>? Feature;
  int? Guarantee;
  int? IsShow;
  String? Machine;
  String? MadeIn;
  String? Name;
  int? ToPrice;
  String? Thumbnail;
  String? WaterProof;
  String? CreatedByName;
  String? CreatedByTime;
  String? CreatedByID;
  String? UpdatedByName;
  String? UpdatedByTime;
  String? UpdatedByID;

  ProductDetailForItem(
    this.Id,
    this.Ablert,
    this.BrandId,
    this.BrandName,
    this.CategoryId,
    this.CategoryName,
    this.Crystal,
    this.ClassifyProducts,
    this.Description,
    this.FromPrice,
    this.Feature,
    this.Guarantee,
    this.IsShow,
    this.Machine,
    this.MadeIn,
    this.Name,
    this.ToPrice,
    this.Thumbnail,
    this.WaterProof,
    this.CreatedByName,
    this.CreatedByTime,
    this.CreatedByID,
    this.UpdatedByName,
    this.UpdatedByTime,
    this.UpdatedByID,
  );

  factory ProductDetailForItem.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailForItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailForItemToJson(this);
}
