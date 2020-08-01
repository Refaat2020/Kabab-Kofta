
import 'package:json_annotation/json_annotation.dart';

part 'shipping_model.g.dart';
@JsonSerializable()
class ShippingModel {
  final String city;
  final String addressLine;
  final String appartmentNo;
  final String floorNo;

  ShippingModel(this.city, this.addressLine, this.appartmentNo, this.floorNo);

  factory ShippingModel.fromJson(Map<String,dynamic> json)=> _$ShippingModelFromJson(json);

  Map<String,dynamic> toJson() =>_$ShippingModelToJson(this);
}
