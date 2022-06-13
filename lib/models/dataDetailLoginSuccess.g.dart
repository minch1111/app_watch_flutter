part of 'dataDetailLoginSuccess.dart';

DataDetailLoginSuccess _$DataDetailLoginSuccessFromJson(Map<String, dynamic> json) {
  return DataDetailLoginSuccess(
      json['AccessToken'] as String?,
      json['ExpiresAccessa'] as String?,
      json['RefreshToken'] as String?,
      json['ExpiresRefresh'] as String? );
}

Map<String, dynamic> _$DataDetailLoginSuccessToJson(DataDetailLoginSuccess instance) =>
    <String, dynamic>{
      "AccessToken": instance.AccessToken,
      "ExpiresAccess": instance.ExpiresAccess,
      "RefreshToken": instance.RefreshToken,
      "ExpiresRefresh": instance.ExpiresRefresh,
    };
