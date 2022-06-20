part of 'bodyOrderToPost.dart';

BodyOrderToPost _$BodyOrderToPostFromJson(Map<String, dynamic> json) {
  return BodyOrderToPost(
    json["ClassifyProductId"] as String?,
    json["ProductName"] as String?,
    json["ClassifyProductName"] as String?,
    json["Price"] as int?,
    json["Count"] as int?,
  );
}

Map<String, dynamic> _$BodyOrderToPostToJson(BodyOrderToPost instance) =>
    <String, dynamic>{
      "ClassifyProductId": instance.ClassifyProductId,
      "ProductName": instance.ProductName,
      "ClassifyProductName": instance.ClassifyProductName,
      "Price": instance.Price,
      "Count": instance.Count
    };
