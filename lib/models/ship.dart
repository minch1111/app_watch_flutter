import 'package:json_annotation/json_annotation.dart';
part 'ship.g.dart';

@JsonSerializable()
class Ship {
  int? From;
  int? To;
  int? Price;


  Ship(
    this.From,
    this.To,
    this.Price,

  );

  factory Ship.fromJson(Map<String, dynamic> json) => _$ShipFromJson(json);

  Map<String, dynamic> toJson() => _$ShipToJson(this);
}
