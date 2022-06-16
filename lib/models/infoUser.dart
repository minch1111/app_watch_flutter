import 'package:example_flutter/models/addressUser.dart';
import 'package:json_annotation/json_annotation.dart';
part 'infoUser.g.dart';

@JsonSerializable()
class InfoUser {
  String? CreatedByName;
  String? CreatedByTime;
  String? CreatedByID;
  String? UpdatedByName;
  String? UpdatedByTime;
  String? UpdatedByID;
  String? FullName;
  String? UserName;
  AddressUser? Location;
  String? Email;
  String? Gender;
  String? Phone;
  String? Birth;
  String? Avatar;
  String? RoleId;
  String? RefreshToken;
  bool? IsEmailConfirmed;
  int? IsActive;

  InfoUser(
    this.CreatedByName,
    this.CreatedByTime,
    this.CreatedByID,
    this.UpdatedByName,
    this.UpdatedByTime,
    this.UpdatedByID,
    this.FullName,
    this.UserName,
    this.Location,
    this.Email,
    this.Gender,
    this.Phone,
    this.Birth,
    this.Avatar,
    this.RoleId,
    this.RefreshToken,
    this.IsEmailConfirmed,
    this.IsActive,
  );

  factory InfoUser.fromJson(Map<String, dynamic> json) =>
      _$InfoUserFromJson(json);

  Map<String, dynamic> toJson() => _$InfoUserToJson(this);
}
