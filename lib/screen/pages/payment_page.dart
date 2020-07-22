

import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:food/widget/big_button.dart';
import 'package:food/widget/form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCard extends StatefulWidget {
  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
FocusNode _focusNode;
bool showBack = false;

String cardNumber;
String cardHolderName;
String cvv;
String expireDate;
GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

@override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus? showBack = true :showBack = false;
      });
    });

  }
@override
void dispose() {
  _focusNode.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        title: Text("Payment",style: GoogleFonts.acme(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(onPressed: (){}, child: Text("Add New", style: GoogleFonts.aBeeZee(
            fontSize: 16,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w600
          ),
          ),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
                child: CreditCard(
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
                        maxlength: 4,
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
                          FormBuilderValidators.minLength(16,errorText: "CVV have a length equal to 4"),
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
                    BigButton(
                      name: "Update Profile",
                        onTap: (){
                  if(fbKey.currentState.validate()) {
                    fbKey.currentState.save();
                    print("object");
                  }
                        },
                    ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}
