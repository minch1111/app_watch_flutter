import 'package:json_annotation/json_annotation.dart';
part 'bodyOrderToPost.g.dart';

@JsonSerializable()
class BodyOrderToPost {
  String? ClassifyProductId;
  String? ProductName;
  String? ClassifyProductName;
  int? Price;
  int? Count;


  BodyOrderToPost(
    this.ClassifyProductId,
    this.ProductName,
    this.ClassifyProductName,
    this.Price,
    this.Count
  );

  factory BodyOrderToPost.fromJson(Map<String, dynamic> json) => _$BodyOrderToPostFromJson(json);

  Map<String, dynamic> toJson() => _$BodyOrderToPostToJson(this);

}