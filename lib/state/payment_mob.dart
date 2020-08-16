
import 'package:food/db/creditcard_info.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

part 'payment_mob.g.dart';

class PaymentStore extends PaymentMob with _$PaymentStore{}

abstract class PaymentMob with Store{
    @observable
  List _infoList = <CreditInfo>[];


  List get infoList => _infoList;

  @action
  Future openBox()async{

    final payment = await Hive.openBox("myPayment",);
  }
  @action
  Future savePayment(CreditInfo info)async
  {
    final box  = await Hive.box("myPayment");
    box.add(info);
  }

  @action
  Future readPayment()async
  {
    final box  = await Hive.box<CreditInfo>("myPayment");
      box.get("myPayment");
  }

}