import 'package:example_flutter/models/productDetailForItem.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dataDetailMain.g.dart';

@JsonSerializable()

class DataDetailMain {
  bool? IsSuccess;
  ProductDetailForItem? Data;
  String? Message;

  DataDetailMain(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory DataDetailMain.fromJson(Map<String,dynamic> json) => _$DataDetailMainFromJson(json);

    Map<String,dynamic> toJson() => _$DataDetailMainToJson(this);
}