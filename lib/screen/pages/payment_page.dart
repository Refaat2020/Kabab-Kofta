import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food/db/creditcard_info.dart';
import 'package:food/helper/locator.dart';
import 'package:food/state/payment_mob.dart';
import 'package:food/widget/payment_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class PaymentCard extends StatefulWidget {
  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final bb = locator<PaymentStore>();
  bool showBack = true;
  CardType cardType;
  final paymentBox = Hive.box("myPayment");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueAccent),
          title: Text(
            "Payment",
            style: GoogleFonts.acme(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey.shade50,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NewPaymentCard()));
              },
              child: Text(
                "Add New",
                style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600),
              ),
              color: Colors.white,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric( vertical: 10),
          child: paymentBox.isNotEmpty
              ? ListView.builder(
                  itemCount: paymentBox.length,
                  itemBuilder: (context, index) {
                    final CreditInfo payment = paymentBox.getAt(index);
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onLongPress: () {
                            payment.delete();
                          },
                          child: CreditCard(
                            height: 200,
                            frontTextColor: Color.fromRGBO(207, 181, 59, 0.7),
                            showShadow: false,
                            cardExpiry: payment.expireDate,
                            cardHolderName: payment.holderName,
                            cardNumber: payment.cardNumber.toString(),
                            cvv: payment.cvv.toString(),
                            cardType: cardType,
                            showBackSide: false,
                            frontBackground: CardBackgrounds.black,
                            backBackground: CardBackgrounds.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                )
              : NewPaymentCard(),
        ),
    );
  }
}
