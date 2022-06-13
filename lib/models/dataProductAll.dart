import 'package:example_flutter/models/productDetail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dataProductAll.g.dart';

@JsonSerializable()

class DataProductAll {
  int? PageIndex;
  int? PageSize;
  List<ProductDetail>? ListProduct;

  DataProductAll(
    this.PageIndex,
    this.PageSize,
    this.ListProduct
  );

  factory DataProductAll.fromJson(Map<String,dynamic> json) => _$DataProductAllFromJson(json);

    Map<String,dynamic> toJson() => _$DataProductAllToJson(this);
}