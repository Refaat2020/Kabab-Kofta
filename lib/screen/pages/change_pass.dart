

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:food/helper/locator.dart';
import 'package:food/state/user_mob.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePass extends StatefulWidget {
  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  bool secure = false;

  bool secure2 = false;

  bool secure3 = false;
String oldPass;
String newPass;
String confirmPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        actionsIconTheme: IconThemeData(
          color: Colors.black54,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text("Change Password",style: GoogleFonts.acme(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,

        ),),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width/4,
            padding: EdgeInsets.all(8),
            child: Card(
              elevation: 8,
                color: Colors.white,
                child: ListTile(
                  //old pass
                  title: FormBuilderTextField(
                    onSaved: (value){
                      oldPass = value;
                    },
                      attribute: "oldPass",
                      initialValue: "",
                      obscureText: secure,
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Old Password",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,

                      ),
                      border: UnderlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            secure = !secure;

                          });
                        },
                        child: Icon(
                          secure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),                    ),
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        attribute: "newPass",
                        onSaved: (value){
                          newPass = value;
                        },
                        initialValue: "",
                        obscureText: secure2,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "New Password",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,

                          ),
                          border: UnderlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                secure2 = !secure2;

                              });
                            },
                            child: Icon(
                              secure2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),                        ),
                      ),
                      FormBuilderTextField(
                        attribute: "rePass",
                        onSaved: (value){
                          confirmPass = value;
                        },
                        initialValue: "",
                        obscureText: secure3,
                        maxLines: 1,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,

                          ),
                          border: UnderlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                secure3 = !secure3;

                              });
                            },
                              child: Icon(
                                secure3
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height/13,
            child: RaisedButton(
              child: Text(
                "Update Password",
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
              onPressed: (){
                locator<UserStore>().changePass( oldPass, newPass);
              },
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.blue.shade700,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 9,
              color:Colors.blueAccent.shade700,
            ),
          ),
          FlatButton(
            visualDensity: VisualDensity(horizontal: 0.8,vertical: 0.9 ),
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("Cancel",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),),
          ),
        ],
      ),
    );
  }
}
