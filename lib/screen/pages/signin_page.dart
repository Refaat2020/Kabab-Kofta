
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your Email or username ",
            hintStyle: TextStyle(color: Colors.grey,fontSize: 18.0,)
      ),
    );
  }
  Widget _buildPassTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Your Password ",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0,)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0,),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sign In',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 100.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Text('Forgotten Password ?',style: TextStyle(fontSize: 18.0,color: Colors.blueAccent,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 40.0,),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    _buildPassTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 40.0,
              width: 300,
              child: RaisedButton(onPressed: (){
              },
                color: Colors.blue,
                focusColor: Colors.blue,
                child: Text('Sign In'),
                hoverColor: Colors.blueAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),side: BorderSide(width: 80.0)),
              ),
            ),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("Don't have an account ? "),
                SizedBox(width: 10.0,),
                Text('Sign up',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18.0),),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
