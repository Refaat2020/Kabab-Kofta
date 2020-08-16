import 'package:awesome_card/awesome_card.dart';
import 'package:awesome_card/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:food/db/creditcard_info.dart';
import 'package:food/helper/locator.dart';
import 'package:food/state/payment_mob.dart';
import 'package:food/widget/big_button.dart';
import 'package:food/widget/form_field.dart';

class NewPaymentCard extends StatefulWidget {
  @override
  _NewPaymentCardState createState() => _NewPaymentCardState();
}

class _NewPaymentCardState extends State<NewPaymentCard> {
  bool showBack = false;

  String cardNumber;

  String cardHolderName;

  String cvv;

  String expireDate;

  CardType cardType;

  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: <Widget>[
          Container(
            child: CreditCard(
              height: 200,
              frontTextColor: Color.fromRGBO(207, 181, 59, 0.7),
              width: MediaQuery.of(context).size.width,
              showShadow: false,
              cardExpiry: expireDate,
              cardHolderName: cardHolderName,
              cardNumber: cardNumber,
              cvv: cvv,
              cardType: CardType.visa,
              showBackSide: showBack,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
            ),
          ),
          Card(
            margin: EdgeInsets.all(12),
            elevation: 0.9,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FormBuilder(
                autovalidate: false,
                key: fbKey,
                readOnly: false,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      BuildForm(
                        initial: cardNumber==null?"":cardNumber,
                        maxlength: 16,
                        hintText: "XX XX XX XX XX XX XX XX",
                        style: TextStyle(
                          color: Colors.black26,

                        ),
                        inputType: TextInputType.number,
                        maxLines: 1,
                        action: TextInputAction.next,
                        valid: [
                          FormBuilderValidators.required(errorText: "This Field is required"),
                          FormBuilderValidators.minLength(16,errorText: "Card number have a length equal to 16"),
                        ],
                        save: ( value){
                          cardNumber = value;
                        },
                        onChange: (value){
                          setState(() {
                            cardNumber =value;
                          });
                        },
                      ),
                      BuildForm(
                        initial: cardHolderName==null?"":cardHolderName,
                        hintText: "Holder Name",
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                        inputType: TextInputType.text,
                        maxLines: 1,
                        action: TextInputAction.next,
                        valid: [
                          FormBuilderValidators.required(errorText: "This Field is required"),

                        ],
                        save: ( value){
                          cardHolderName = value;
                        },
                        onChange: (value){
                          setState(() {
                            cardHolderName =value;
                          });
                        },
                      ),
                      SizedBox(height: 20,),

                      BuildForm(
                        initial: expireDate==null?"":expireDate,
                        valid: [
                          FormBuilderValidators.pattern("/",errorText: "Expire data must have /"),
                          FormBuilderValidators.required(errorText: "This Field is required"),

                        ],
                        inputType: TextInputType.number,
                        maxlength: 5,
                        hintText: "Month/Year",
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                        save: ( value){
                          expireDate = value;
                        },
                        onChange: (value){
                          setState(() {
                            expireDate =value;
                          });
                        },
                      ),
                      BuildForm(
                        initial: cvv==null?"":cvv,
                        valid: [
                          FormBuilderValidators.required(errorText: "This Field is required"),
                        ],
                        inputType: TextInputType.number,
                        maxlength: 4,
                        hintText: "CVV",
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                        save: ( value){
                          cvv = value;
                        },
                        onChange: (value){
                          setState(() {
                            cvv =value;
                          });
                        },
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigButton(
              color: Colors.blue,
              name: "Update Profile",
              onTap: ()async{
                if(fbKey.currentState.validate()) {
                  fbKey.currentState.save();
                  print("object");
                  final newInfo = CreditInfo(
                    holderName: cardHolderName,
                    expireDate: expireDate,
                    cvv: int.parse(cvv),
                    cardNumber: int.parse(cardNumber),
                  );
                  await locator<PaymentStore>().savePayment(newInfo);

                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
