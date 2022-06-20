import 'package:example_flutter/models/cart.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dataCart.g.dart';

@JsonSerializable()

class DataCart {
  bool? IsSuccess;
  Cart? Data;
  String? Message;

  DataCart(
    this.IsSuccess,
    this.Data,
    this.Message
  );

  factory DataCart.fromJson(Map<String,dynamic> json) => _$DataCartFromJson(json);

    Map<String,dynamic> toJson() => _$DataCartToJson(this);
}