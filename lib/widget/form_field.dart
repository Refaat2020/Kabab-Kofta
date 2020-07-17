

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


// ignore: must_be_immutable
class BuildForm extends StatefulWidget  {
     GlobalKey<FormBuilderState> fbKey1 = GlobalKey<FormBuilderState>();
 String hintText ;
 TextEditingController editingController;
 TextStyle style;
  int maxLines;
  TextInputType inputType;
  IconData icon;
  TextInputAction action;
List <FormFieldValidator>valid;
  Function save;

 BuildForm({ this.fbKey1,this.hintText, this.style, this.maxLines,
      this.inputType, this.icon,this.action  ,this.valid ,this.save , this.editingController});

  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilderTextField(
            attribute: "null",
          autovalidate: false,
//            controller: editingController,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.style,
            prefixIcon: Icon(widget.icon),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
            ),
          ),
          maxLines: widget.maxLines,
          keyboardType: widget.inputType,
          validators:widget.valid,
          autofocus: false,
            textInputAction: widget.action,
            keyboardAppearance: Brightness.light,
          onChanged: widget.save,

        ),
      ],
    );
  }
}
