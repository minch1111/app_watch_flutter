import 'package:json_annotation/json_annotation.dart';
part 'productDetail.g.dart';


@JsonSerializable()

class ProductDetail {
    String? Id;
    String? CategoryId;
    String? CategoryName;
    String? BrandId;
    String? BrandName;
    String? Name;
    int? FromPrice;
    int? ToPrice;
    List<String>? Feature;
    String? Description;
    String? Thumbnail;
    String? Machine;
    int? IsShow;
    String? CreatedByName;
    String? CreatedByTime;
    String? CreatedByID;
    String? UpdatedByName;
    String? UpdatedByTime;
    String? UpdatedByID;

    ProductDetail(
      this.Id,
    this.CategoryId,
    this.CategoryName,
    this.BrandId,
    this.BrandName,
    this.Name,
    this.FromPrice,
    this.ToPrice,
    this.Feature,
    this.Description,
    this.Thumbnail,
    this.Machine,
    this.IsShow,
    this.CreatedByName,
    this.CreatedByTime,
    this.CreatedByID,
    this.UpdatedByName,
    this.UpdatedByTime,
    this.UpdatedByID,
    );

    factory ProductDetail.fromJson(Map<String,dynamic> json) => _$ProductDetailFromJson(json);

    Map<String,dynamic> toJson() => _$ProductDetailToJson(this);
}