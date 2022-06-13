part of 'classifyProduct.dart';

ClassifyProduct _$ClassifyProductFromJson(Map<String, dynamic> json) {
  return ClassifyProduct(
    json['Id'] as String?,
    json['ProductId'] as String?,
    json['Image'] as String?,
    json['Name'] as String?,
    json['OriginalPrice'] as int?,
    json['PromotionPrice'] as int?,
    json['Stock'] as int?,
    json['IsShow'] as int?,
    // json['Feature'] as List<String>?,
    // (json['Feature'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['CreatedByName'] as String?,
    json['CreatedByTime'] as String?,
    json['CreatedByID'] as String?,
    json['UpdatedByName'] as String?,
    json['UpdatedByTime'] as String?,
    json['UpdatedByID'] as String?,
  );
}

Map<String, dynamic> _$ClassifyProductToJson(ClassifyProduct instance) =>
    <String, dynamic>{
      "Id": instance.Id,
      "ProductId": instance.ProductId,
      "Image": instance.Image,
      "Name": instance.Name,
      "Price": instance.OriginalPrice,
      "PromotionPrice": instance.PromotionPrice,
      "Stock": instance.Stock,
      "IsShow": instance.IsShow,
      "CreatedByName": instance.CreatedByName,
      "CreatedByTime": instance.CreatedByTime,
      "CreatedByID": instance.CreatedByID,
      "UpdatedByName": instance.UpdatedByName,
      "UpdatedByTime": instance.UpdatedByTime,
      "UpdatedByID": instance.UpdatedByID,
    };