// import 'package:example_flutter/models/productDetailForItem.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dataDetailLoginSuccess.g.dart';

@JsonSerializable()

class DataDetailLoginSuccess {
  String? AccessToken;
  String? ExpiresAccess;
  String? RefreshToken;
  String? ExpiresRefresh;

  DataDetailLoginSuccess(
    this.AccessToken,
    this.ExpiresAccess,
    this.RefreshToken,
    this.ExpiresRefresh
  );

  factory DataDetailLoginSuccess.fromJson(Map<String,dynamic> json) => _$DataDetailLoginSuccessFromJson(json);

    Map<String,dynamic> toJson() => _$DataDetailLoginSuccessToJson(this);
}