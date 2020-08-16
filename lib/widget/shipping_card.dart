import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingCard extends StatelessWidget {
  String city;
  String addrees;
  String appartment;
  GlobalKey<FormBuilderState> fbkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(
        12,
      ),
      elevation: 9,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20, top: 10),
        child: FormBuilder(
          key: fbkey,
          autovalidate: false,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                attribute: "city",
                maxLines: 1,
                onSaved: (value) {
                  city = value;
                },
                initialValue: city == null ? "" : city,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "City", border: UnderlineInputBorder()),
                style: GoogleFonts.aBeeZee(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                validators: [
                  FormBuilderValidators.required(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                attribute: "address",
                maxLines: 1,
                onSaved: (value) {
                  addrees = value;
                },
                initialValue: addrees == null ? "" : city,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Address",
                    suffixIcon: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    border: UnderlineInputBorder()),
                style: GoogleFonts.aBeeZee(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                validators: [
                  FormBuilderValidators.required(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                attribute: "Appartement",
                maxLines: 1,
                onSaved: (value) {
                  appartment = value;
                },
                initialValue: city == null ? "" : city,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Appartement", border: UnderlineInputBorder()),
                style: GoogleFonts.aBeeZee(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                validators: [
                  FormBuilderValidators.required(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
