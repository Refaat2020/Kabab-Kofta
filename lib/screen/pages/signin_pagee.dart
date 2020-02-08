import 'package:flutter/material.dart';
import 'package:food/screen/pages/signup_page.dart';
import 'package:food/screen/src/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String email, password;
bool _toogleVisbilty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset("asset/images/background.png",fit: BoxFit.fill,),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[//logo
                      Center(child: Image.asset("asset/images/7ati.jpg",height: 120,
                        width: 220,alignment: Alignment.center,)),
                      SizedBox(height: 13,),
                      Text("El Haty", style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 27,color: Colors.white,
                              letterSpacing: 1
                          )
                      ),),
                      SizedBox(height: 18,),
                      Container(
                        width: 180,
                        child: Text("86 Al Rehab city , cairo", textAlign: TextAlign.center,style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white54,
                              letterSpacing: 0.6,
                              fontSize: 13
                          ),
                        ),),
                      ),
                      SizedBox(height: 20,),
                      Text("Sign In", textAlign: TextAlign.center,style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 23,
                        ),
                      ),),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("You'r Delicios meal is Waiting 😋", textAlign: TextAlign.center,style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.white70,
                              letterSpacing: 1,
                              fontSize: 17,
                            ),
                          ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Form(
                        autovalidate: true,
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 45),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  hintText: "Email",hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15
                                ),
                                ),
                                onSaved: (val){
                                  email = val;
                                },
                              ),
                              SizedBox(height: 16,),
                              TextFormField(
                                style: TextStyle(color: Colors.white),

                                obscureText: _toogleVisbilty,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                      icon: _toogleVisbilty ? Icon(Icons.visibility_off,color: Colors.white,) :Icon(Icons.visibility,color: Colors.white,),
                                      onPressed: (){
                                        setState(() {
                                          _toogleVisbilty = !_toogleVisbilty;
                                        });
                                      }
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  hintText: "Password",hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                ),
                                ),
                                onSaved: (val){
                                  email = val;
                                },
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text("SUBMIT",textAlign: TextAlign.center,style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          letterSpacing: 1
                                      )
                                  ),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("OR",style: TextStyle(
                          fontSize: 14,
                          color: Colors.white60
                      ),),
                       SizedBox(height: 10,),
                       Image.asset("asset/images/fingerprint.png", height: 36, width: 36,),
                       SizedBox(height: 10,),
                       GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text("Don't have an account?", style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                                letterSpacing: 0.5
                            )
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}