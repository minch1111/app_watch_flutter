import 'package:example_flutter/models/banner.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bannerMain.g.dart';

@JsonSerializable()

class BannerMain {
  bool? IsSuccess;
  List<Banner>? Data;
  String? Message;

  BannerMain(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory BannerMain.fromJson(Map<String,dynamic> json) => _$BannerMainFromJson(json);

    Map<String,dynamic> toJson() => _$BannerMainToJson(this);
}