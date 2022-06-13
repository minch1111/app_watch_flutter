// import 'package:example_flutter/models/productDetailForItem.dart';
import 'package:example_flutter/models/dataDetailLoginSuccess.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dataLoginSuccess.g.dart';

@JsonSerializable()

class DataLoginSuccess {
  bool? IsSuccess;
  DataDetailLoginSuccess? Data;
  String? Message;

  DataLoginSuccess(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory DataLoginSuccess.fromJson(Map<String,dynamic> json) => _$DataLoginSuccessFromJson(json);

    Map<String,dynamic> toJson() => _$DataLoginSuccessToJson(this);
}