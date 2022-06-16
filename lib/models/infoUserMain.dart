import 'package:example_flutter/models/infoUser.dart';
import 'package:json_annotation/json_annotation.dart';
part 'infoUserMain.g.dart';

@JsonSerializable()

class InfoUserMain {
  bool? IsSuccess;
  InfoUser? Data;
  String? Message;

  InfoUserMain(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory InfoUserMain.fromJson(Map<String,dynamic> json) => _$InfoUserMainFromJson(json);

    Map<String,dynamic> toJson() => _$InfoUserMainToJson(this);
}