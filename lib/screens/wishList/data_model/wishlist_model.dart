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
import '../../product_screen/data_model/product_details_model.dart';

part 'wishlist_model.g.dart';

@JsonSerializable()
class WishListData extends BaseModel {
  List<WishlistData>? data;

  WishListData({this.data});

  factory WishListData.fromJson(Map<String, dynamic> json) =>
      _$WishListDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WishListDataToJson(this);
}

@JsonSerializable()
class WishlistData {
  String? id;
  String? productId;
  Product? product;

  WishlistData({
    this.id,
    this.productId,
    this.product,
  });

  factory WishlistData.fromJson(Map<String, dynamic> json) =>
      _$WishlistDataFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistDataToJson(this);
}

// @JsonSerializable()
// class Customer {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? name;
//   String? gender;
//   String? dateOfBirth;
//   String? email;
//   String? phone;
//   String? password;
//   String? apiToken;
//   int? customerGroupId;
//   bool? subscribedToNewsLetter;
//   bool? isVerified;
//   String? token;
//   String? notes;
//   bool? status;
//   String? createdAt;
//   String? updatedAt;

//   Customer(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.name,
//       this.gender,
//       this.dateOfBirth,
//       this.email,
//       this.phone,
//       this.password,
//       this.apiToken,
//       this.customerGroupId,
//       this.subscribedToNewsLetter,
//       this.isVerified,
//       this.token,
//       this.notes,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   factory Customer.fromJson(Map<String, dynamic> json) =>
//       _$CustomerFromJson(json);

//   Map<String, dynamic> toJson() => _$CustomerToJson(this);
// }
