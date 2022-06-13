import 'package:example_flutter/models/dataProductAll.dart';
// ignore: unused_import
import 'package:example_flutter/models/productDetail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dataMainProductAll.g.dart';

@JsonSerializable()

class DataMainProductAll {
  bool? IsSuccess;
  DataProductAll? Data;
  String? Message;

  DataMainProductAll(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory DataMainProductAll.fromJson(Map<String,dynamic> json) => _$DataMainProductAllFromJson(json);

    Map<String,dynamic> toJson() => _$DataMainProductAllToJson(this);
}