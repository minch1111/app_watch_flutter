import 'package:json_annotation/json_annotation.dart';
part 'orderDetails.g.dart';

@JsonSerializable()
class OrderDetail {
  String? ClassifyProductId;
  String? ProductName;
  String? ClassifyProductName;
  int? Price;
  String? Image;
  int? Count;


  OrderDetail(
    this.ClassifyProductId,
    this.ProductName,
    this.ClassifyProductName,
    this.Price,
    this.Image,
    this.Count
  );

  factory OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);

}