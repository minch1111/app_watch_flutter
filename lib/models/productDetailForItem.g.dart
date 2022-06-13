part of 'productDetailForItem.dart';

ProductDetailForItem _$ProductDetailForItemFromJson(Map<String, dynamic> json) {
  return ProductDetailForItem (
    json['Id'] as String?,
    json['Ablert'] as String?,
    json['BrandId'] as String?,
    json['BrandName'] as String?,
    json['CategoryId'] as String?,
    json['CategoryName'] as String?,
    json['Crystal'] as String?,
    (json['ClassifyProducts'] as List<dynamic>?)?.map((e) => ClassifyProduct.fromJson(e as Map<String,dynamic>)).toList(),
    json['Description'] as String?,
    json['FromPrice'] as int?,
    (json['Feature'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['Guarantee'] as int?,
    json['IsShow'] as int?,
    json['Machine'] as String?,
    json['MadeIn'] as String?,
    json['Name'] as String?,
    json['ToPrice'] as int?,
    json['Thumbnail'] as String?,
    json['WaterProof'] as String?,
    json['CreatedByName'] as String?,
    json['CreatedByTime'] as  String?,
    json['CreatedByID'] as  String?,
    json['UpdatedByName'] as  String?,
    json['UpdatedByTime'] as  String?,
    json['UpdatedByID'] as  String?,

  );
}

Map<String, dynamic> _$ProductDetailForItemToJson(ProductDetailForItem instance) =>
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
      "ClassifyProducts":instance.ClassifyProducts,
      "Guarantee" :instance.Guarantee,
      "MadeIn":instance.MadeIn,
      "Crystal":instance.Crystal,
      "WaterProof":instance.WaterProof,
      "Ablert":instance.Ablert,
      "CreatedByName": instance.CreatedByName,
      "CreatedByTime": instance.CreatedByTime,
      "CreatedByID": instance.CreatedByID,
      "UpdatedByName": instance.UpdatedByName,
      "UpdatedByTime": instance.UpdatedByTime,
      "UpdatedByID": instance.UpdatedByID,
    };