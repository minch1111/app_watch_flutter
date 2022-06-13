// import 'package:example_flutter/models/productDetailForItem.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dataError400.g.dart';

@JsonSerializable()

class DataError400 {
  bool? IsSuccess;
  dynamic Data;
  String? Message;

  DataError400(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory DataError400.fromJson(Map<String,dynamic> json) => _$DataError400FromJson(json);

    Map<String,dynamic> toJson() => _$DataError400ToJson(this);
}