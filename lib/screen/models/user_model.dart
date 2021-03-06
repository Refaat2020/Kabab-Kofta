
import 'package:food/screen/models/shipping_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel{
  String id;
  String idToken;
  String username;
  String email;
  ShippingModel address;
  String phoneNumber;
  String userType;

  UserModel({this.username, this.email, this.address,
      this.phoneNumber, this.userType , this.id,this.idToken});

  factory UserModel.fromJson(Map<String,dynamic> json)=> _$UserModelFromJson(json);

  Map<String,dynamic> toJson() =>_$UserModelToJson(this);
}