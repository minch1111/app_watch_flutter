import 'package:json_annotation/json_annotation.dart';
part 'banner.g.dart';

@JsonSerializable()
class Banner {
  String? Id;
  String? ImageBanner;
  String? Content;
  int? IsShowOnMobile;
  String? IdProduct;
  String? ProductName;
  int? Price;
  String? CreatedByName;
  String? CreatedByTime;
  String? CreatedByID;
  String? UpdatedByName;
  String? UpdatedByTime;
  String? UpdatedByID;

  Banner(
      this.Id,
      this.ImageBanner,
      this.Content,
      this.IsShowOnMobile,
      this.IdProduct,
      this.ProductName,
      this.Price,
      this.CreatedByName,
      this.CreatedByTime,
      this.CreatedByID,
      this.UpdatedByName,
      this.UpdatedByTime,
      this.UpdatedByID);

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
