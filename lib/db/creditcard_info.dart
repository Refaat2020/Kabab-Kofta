
import 'package:hive/hive.dart';

part 'creditcard_info.g.dart';
@HiveType(typeId: 0,adapterName: "CreditInfoAdapter" )
class  CreditInfo extends HiveObject{

  @HiveField(0)
  int cardNumber;

  @HiveField(1)
  String holderName;

  @HiveField(2)
  String expireDate;

  @HiveField(3)
  int cvv;

  CreditInfo({this.cardNumber, this.holderName, this.expireDate, this.cvv});
}