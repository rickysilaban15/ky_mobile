/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import 'package:json_annotation/json_annotation.dart';

import '../../../data_model/graphql_base_model.dart';
import 'country_model.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel extends BaseModel {
  @JsonKey(name: "data")
  List<AddressData>? addressData = [];
  CountriesData? countryData;
  AddressModel({this.addressData});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class AddressData {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? companyName;
  String? vatId;
  @JsonKey(name: "address", defaultValue: "")
  String? address1;
  String? country;
  String? countryName;
  String? stateName;
  String? state;
  String? city;
  String? postcode;
  String? phone;
  @JsonKey(name: "defaultAddress", defaultValue: false)
  bool? isDefault;
  // String? createdAt;
  // String? updatedAt;
  // String? addressType;
  int? billingAddressId;
  int? shippingAddressId;

  AddressData(
      {this.id,
      this.firstName,
      this.lastName,
      this.companyName,
      this.vatId,
      this.address1,
      this.country,
      this.countryName,
      this.stateName,
      this.state,
      this.city,
      this.postcode,
      this.phone,
      this.isDefault,
      this.shippingAddressId,
      this.billingAddressId,
      this.email});
  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}
