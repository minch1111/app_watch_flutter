import 'package:example_flutter/models/news.dart';
import 'package:json_annotation/json_annotation.dart';
part 'newsMain.g.dart';

@JsonSerializable()

class NewsMain {
  bool? IsSuccess;
  List<Blog>? Data;
  String? Message;

  NewsMain(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory NewsMain.fromJson(Map<String,dynamic> json) => _$NewsMainFromJson(json);

    Map<String,dynamic> toJson() => _$NewsMainToJson(this);
}