part of 'addressUser.dart';

AddressUser _$AddressUserFromJson(Map<String, dynamic> json) {
  return AddressUser(
    json['Province'] as String?,
    json['District'] as String?,
    json['Ward'] as String?,
    json['Address'] as String?,

  );
}

Map<String, dynamic> _$AddressUserToJson(AddressUser instance) => <String, dynamic>{
      "Province": instance.Province,
      "District": instance.District,
      "Ward": instance.Ward,
      "Address": instance.Address,
    };
