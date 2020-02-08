
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: TextField(

        decoration: InputDecoration(
            hintText: "Search any food",
            suffixIcon: Material(elevation: 5.0,borderRadius: BorderRadius.circular(30),
              child: Icon(
                  Icons.search,
                      color: Colors.black,
              ),
            ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 32.0,top: 15.0)
        ),
      ),
    );
  }
}
