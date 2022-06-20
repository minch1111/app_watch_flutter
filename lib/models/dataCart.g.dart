part of 'dataCart.dart';

DataCart _$DataCartFromJson(Map<String, dynamic> json) {
  return DataCart(
      json['IsSuccess'] as bool?,
      json['Data'] == null
          ? null
          : Cart.fromJson(json['Data'] as Map<String, dynamic>),
      json['Message'] as String?);
}

Map<String, dynamic> _$DataCartToJson(DataCart instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
