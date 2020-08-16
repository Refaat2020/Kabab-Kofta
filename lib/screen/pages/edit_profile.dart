
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food/helper/constant.dart';
import 'package:food/widget/big_button.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormBuilderState>fbkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app,color: Colors.grey.shade600,), onPressed: (){
            dialogCheckLogOut(context);
          }),
        ],

        actionsIconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor:  Colors.grey.shade50,
        title: Text("Edit Profile",style: GoogleFonts.acme(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Observer(
        builder: (BuildContext context){
          return ListView(
            children: <Widget>[
              ///for image and icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ///for user image
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50,horizontal: 80),
                    height: 140.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      image: DecorationImage(
                          image: AssetImage('asset/images/7mam.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80 ,right:0,left: 0 ),
                          child: Icon(Icons.file_upload,color: Colors.grey.shade600,size: 30,),
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Icon(Icons.delete,color: Colors.grey.shade600,size: 30,),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              ///for Text Account
              Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Account",style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
                ),
              ),
              SizedBox(height: 10,),
              ///for textfields
              FormBuilder(
                key: fbkey,
                onChanged: (value){

                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 9,
                  color: Colors.white,
                  child: ListTile(
                    ///for username
                    title: FormBuilderTextField(
                      attribute: null,
                      initialValue: "refaat taha",
                      onSaved: (value){

                      },
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Divider(color: Colors.black,thickness: 0.5,),
                        ///for phone number
                        FormBuilderPhoneField(

                          maxLength: 10,
                          attribute: "phone number",
                          isCupertinoPicker: false,
                          initialValue: "+201009856754",
                          onSaved: (value){

                          },
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                        Divider(color: Colors.black,thickness: 0.8,),
                        ///for email
                        FormBuilderTextField(
                          attribute: "email",
                          initialValue: "refaattaha2020@gmail.com",
                          onSaved: (value){

                          },
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),

              SizedBox(height: 10,),
              ///for remove Account
              Container(
                margin: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height/10,
                child: Card(

                  color: Colors.white,
                  elevation: 9,
                  child:Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.delete_outline,color: Colors.redAccent,size: 33,),
                      ),
                      SizedBox(width: 30,),
                      GestureDetector(
                        onTap: (){
                          dialogRemoveAccount(context);
                        },
                        child: Text("Remove Account",style: GoogleFonts.actor(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              BigButton(
                name: "Update Profile",
                onTap: (){
                },
                color: Colors.blueAccent,
              )
            ],
          );
        },
      ),
    );
  }
}
