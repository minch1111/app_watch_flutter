import 'package:example_flutter/models/brand.dart';
import 'package:json_annotation/json_annotation.dart';
part 'brandMain.g.dart';

@JsonSerializable()

class BrandMain {
  bool? IsSuccess;
  List<Brand>? Data;
  String? Message;

  BrandMain(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory BrandMain.fromJson(Map<String,dynamic> json) => _$BrandMainFromJson(json);

    Map<String,dynamic> toJson() => _$BrandMainToJson(this);
}