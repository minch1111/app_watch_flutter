import 'package:json_annotation/json_annotation.dart';
part 'addressUser.g.dart';

@JsonSerializable()
class AddressUser {
  String? Province;
  String? District;
  String? Ward;
  String? Address;


  AddressUser(
    this.Province,
    this.District,
    this.Ward,
    this.Address,
  );

  factory AddressUser.fromJson(Map<String, dynamic> json) =>
      _$AddressUserFromJson(json);

  Map<String, dynamic> toJson() => _$AddressUserToJson(this);
}
