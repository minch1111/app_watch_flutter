part of 'banner.dart';

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
    json['Id'] as String?,
    json['ImageBanner'] as String?,
    json['Content'] as String?,
    json['IsShowOnMobile'] as int?,
    json['IdProduct'] as String?,
    json['ProductName'] as String?,
    json['Price'] as int?,
    json['CreatedByName'] as String?,
    json['CreatedByTime'] as String?,
    json['CreatedByID'] as String?,
    json['UpdatedByName'] as String?,
    json['UpdatedByTime'] as String?,
    json['UpdatedByID'] as String?,
  );
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      "Id": instance.Id,
      "ImageBanner": instance.ImageBanner,
      "Content": instance.Content,
      "IsShowOnMobile": instance.IsShowOnMobile,
      "IdProduct": instance.IdProduct,
      "ProductName": instance.ProductName,
      "Price": instance.Price,
      "CreatedByName": instance.CreatedByName,
      "CreatedByTime": instance.CreatedByTime,
      "CreatedByID": instance.CreatedByID,
      "UpdatedByName": instance.UpdatedByName,
      "UpdatedByTime": instance.UpdatedByTime,
      "UpdatedByID": instance.UpdatedByID,
    };
