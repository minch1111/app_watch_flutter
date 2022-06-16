import 'package:example_flutter/models/category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categoryMain.g.dart';

@JsonSerializable()

class CategoryMain {
  bool? IsSuccess;
  List<Category>? Data;
  String? Message;

  CategoryMain(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory CategoryMain.fromJson(Map<String,dynamic> json) => _$CategoryMainFromJson(json);

    Map<String,dynamic> toJson() => _$CategoryMainToJson(this);
}