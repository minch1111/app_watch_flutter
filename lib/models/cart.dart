import 'package:example_flutter/models/orderDetail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart.g.dart';

@JsonSerializable()
class Cart {
  String? Id;
  List<OrderDetail>? OrderDetails;

  Cart(
    this.Id,
    this.OrderDetails,
  );

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
