part of 'productDetail.dart';

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) {
  return ProductDetail(
    json['Id'] as String?,
    json['CategoryId'] as String?,
    json['CategoryName'] as String?,
    json['BrandId'] as String?,
    json['BrandName'] as String?,
    json['Name'] as String?,
    json['FromPrice'] as int?,
    json['ToPrice'] as int?,
    // json['Feature'] as List<String>?,
    (json['Feature'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['Description'] as String?,
    json['Thumbnail'] as String?,
    json['Machine'] as String?,
    json['IsShow'] as int?,
    json['CreatedByName'] as String?,
    json['CreatedByTime'] as String?,
    json['CreatedByID'] as String?,
    json['UpdatedByName'] as String?,
    json['UpdatedByTime'] as String?,
    json['UpdatedByID'] as String?,
  );
}

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      "Id": instance.Id,
      "CategoryId": instance.CategoryId,
      "CategoryName": instance.CategoryName,
      "BrandId": instance.BrandId,
      "BrandName": instance.BrandName,
      "Name": instance.Name,
      "FromPrice": instance.FromPrice,
      "ToPrice": instance.ToPrice,
      "Feature": instance.Feature,
      "Description": instance.Description,
      "Thumbnail": instance.Thumbnail,
      "Machine": instance.Machine,
      "IsShow": instance.IsShow,
      "CreatedByName": instance.CreatedByName,
      "CreatedByTime": instance.CreatedByTime,
      "CreatedByID": instance.CreatedByID,
      "UpdatedByName": instance.UpdatedByName,
      "UpdatedByTime": instance.UpdatedByTime,
      "UpdatedByID": instance.UpdatedByID,
    };
