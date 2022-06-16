part of 'infoUser.dart';

InfoUser _$InfoUserFromJson(Map<String, dynamic> json) {
  return InfoUser(
    json['CreatedByName'] as String?,
    json['CreatedByTime'] as String?,
    json['CreatedByID'] as String?,
    json['UpdatedByName'] as String?,
    json['UpdatedByTime'] as String?,
    json['UpdatedByID'] as String?,
    json['FullName'] as String?,
    json['UserName'] as String?,
    json['Location'] == null
          ? null
          : AddressUser.fromJson(json['Location'] as Map<String, dynamic>),
    json['Email'] as String?,
    json['Gender'] as String?,
    json['Phone'] as String?,
    json['Birth'] as String?,
    json['Avatar'] as String?,
    json['RoleId'] as String?,
    json['RefreshToken'] as String?,
    json['IsEmailConfirmed'] as bool?,
    json['IsActive'] as int?,
  );
}

Map<String, dynamic> _$InfoUserToJson(InfoUser instance) =>
    <String, dynamic>{
      "CreatedByName" : instance.CreatedByName,
    "CreatedByTime" : instance.CreatedByTime,
    "CreatedByID" : instance.CreatedByID,
    "UpdatedByName" : instance.UpdatedByName,
    "UpdatedByTime" : instance.UpdatedByTime,
    "UpdatedByID" : instance.UpdatedByID,
    "FullName" : instance.FullName,
    "UserName" : instance.UserName,
    "Location" : instance.Location,
    "Email" : instance.Email,
    "Gender" : instance.Gender,
    "Phone" : instance.Phone,
    "Birth" : instance.Birth,
    "Avatar" : instance.Avatar,
    "RoleId" : instance.RoleId,
    "RefreshToken" : instance.RefreshToken,
    "IsEmailConfirmed" : instance.IsEmailConfirmed,
    "IsActive" : instance.IsActive,
    };
