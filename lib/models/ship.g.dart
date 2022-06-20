part of 'ship.dart';

Ship _$ShipFromJson(Map<String, dynamic> json) {
  return Ship(
    json["From"] as int?,
    json["To"] as int?,
    json["Price"] as int?,
  );
}

Map<String, dynamic> _$ShipToJson(Ship instance) => <String, dynamic>{
      "From": instance.From,
      "To": instance.To,
      "Price": instance.Price,
    };
