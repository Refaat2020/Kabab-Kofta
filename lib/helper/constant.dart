
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle simpleStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 16 , color: Colors.black);
TextStyle descriptionStyle = TextStyle(fontSize: 12 ,fontWeight: FontWeight.w600 , color: Colors.black54 ,);

///dialog check Internet in every Button Action
dialogCheckInternet(BuildContext context){
  AwesomeDialog(
      context: context,
    title: "Please Check The internet Connection",
    desc: "There no internet connection Pleas Try again later",
      dialogType: DialogType.ERROR,
    dismissOnTouchOutside: true,
  ).show();

}

///check internet
checkInternet(BuildContext context) async {
// Simple check to see if we have internet
  print("The statement 'this machine is connected to the Internet' is: ");
  print(await DataConnectionChecker().hasConnection);
  // returns a bool

  // We can also get an enum value instead of a bool
  print("Current status: ${await DataConnectionChecker().connectionStatus}");
  // prints either DataConnectionStatus.connected
  // or DataConnectionStatus.disconnected

  // This returns the last results from the last call
  // to either hasConnection or connectionStatus
  print("Last results: ${DataConnectionChecker().lastTryResults}");

  // actively listen for status updates
  // this will cause DataConnectionChecker to check periodically
  // with the interval specified in DataConnectionChecker().checkInterval
  // until listener.cancel() is called
  var listener = DataConnectionChecker().onStatusChange.listen((status) {
    switch (status) {
      case DataConnectionStatus.connected:
        print('Data connection is available.');
        break;
      case DataConnectionStatus.disconnected:
        print('You are disconnected from the internet.');
        dialogCheckInternet(context);
        break;
    }
  });

  // close listener after 30 seconds, so the program doesn't run forever
  await Future.delayed(Duration(seconds: 5));
  await listener.cancel();
}

///dialog for logOut
//todo add logOut method
dialogCheckLogOut(BuildContext context){
  AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      dismissOnTouchOutside: true,
    body:Column(
      children: <Widget>[
        AutoSizeText("Login Out",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        ),
        SizedBox(height: 15,),
        AutoSizeText("Are you sure want to log out",style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        ),
        SizedBox(height: 15,),
        ///login out Button
        Container(
          width: MediaQuery.of(context).size.width/1.5,
          height: MediaQuery.of(context).size.height/13,
          child: RaisedButton(
            child: Text(
              "Login Out",
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                color: Colors.blue.shade900
              ),
            ),
              onPressed: (){},
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.deepPurple.shade900,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 9,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10,),
        ///Cancel Button
        Container(
          width: MediaQuery.of(context).size.width/1.5,
          height: MediaQuery.of(context).size.height/13,
          child: RaisedButton(
            child: Text(
              "Cancel",
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blueAccent.shade700,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 9,
            color:Colors.blueAccent.shade700,
          ),
        ),
      ],
    ) ,
  ).show();
}

///for dialog in the edit Profile Page
//todo add remove method
dialogRemoveAccount(BuildContext context){

  AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    dismissOnTouchOutside: true,
    body:Column(
      children: <Widget>[
        AutoSizeText("Remove Account",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        ),
        SizedBox(height: 15,),
        AutoSizeText("Are you sure you want to remove account ?",style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        ),
        SizedBox(height: 15,),
        ///login out Button
        Container(
          width: MediaQuery.of(context).size.width/1.5,
          height: MediaQuery.of(context).size.height/13,
          child: RaisedButton(
            child: Text(
              "Remove Account",
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue.shade900
              ),
            ),
            onPressed: (){},
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.deepPurple.shade900,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 9,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10,),
        ///Cancel Button
        Container(
          width: MediaQuery.of(context).size.width/1.5,
          height: MediaQuery.of(context).size.height/13,
          child: RaisedButton(
            child: Text(
              "Cancel",
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blueAccent.shade700,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 9,
            color:Colors.blueAccent.shade700,
          ),
        ),
      ],
    ) ,
  ).show();
}