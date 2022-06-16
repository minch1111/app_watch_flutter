part of 'infoUserMain.dart';

InfoUserMain _$InfoUserMainFromJson(Map<String, dynamic> json) {
  return InfoUserMain(
      json['IsSuccess'] as bool?,
      json['Data'] == null
          ? null
          : InfoUser.fromJson(json['Data'] as Map<String, dynamic>),
      json['Message'] as String?);
}

Map<String, dynamic> _$InfoUserMainToJson(InfoUserMain instance) =>
    <String, dynamic>{
      "IsSuccess": instance.IsSuccess,
      "Data": instance.Data,
      "Message": instance.Message,
    };
