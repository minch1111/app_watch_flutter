// ignore: file_names
import 'package:json_annotation/json_annotation.dart';
import 'package:example_flutter/models/productDetail.dart';
part 'dataSearch.g.dart';

@JsonSerializable()
class DataSearch {
  bool? IsSuccess;
  List<ProductDetail>? Data;
  String? Message;

  DataSearch(this.IsSuccess, this.Data, this.Message);

  factory DataSearch.fromJson(Map<String, dynamic> json) =>
      _$DataSearchFromJson(json);

  Map<String, dynamic> toJson() => _$DataSearchToJson(this);
}
