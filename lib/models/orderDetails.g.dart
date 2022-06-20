part of 'orderDetail.dart';

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) {
  return OrderDetail(
    json["ClassifyProductId"] as String?,
    json["ProductName"] as String?,
    json["ClassifyProductName"] as String?,
    json["Price"] as int?,
    json["Image"] as String?,
    json["Count"] as int?,
  );
}

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      "ClassifyProductId": instance.ClassifyProductId,
      "ProductName": instance.ProductName,
      "ClassifyProductName": instance.ClassifyProductName,
      "Price": instance.Price,
      "Image": instance.Image,
      "Count": instance.Count
    };
