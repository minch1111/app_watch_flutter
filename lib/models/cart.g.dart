part of 'cart.dart';

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    json["Id"] as String?,
    (json['OrderDetails'] ==null? null :json["OrderDetails"] as List<dynamic>?)?.map((e) => OrderDetail.fromJson(e as Map<String,dynamic>)).toList(),
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      "Id": instance.Id,
      "OrderDetails": instance.OrderDetails,
    };
