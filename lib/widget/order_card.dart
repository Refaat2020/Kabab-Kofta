import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 75.5,
              width: 45.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Color(0xffd3d3d3)),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  InkWell(
                    child:
                        Icon(Icons.keyboard_arrow_up, color: Color(0xffd3d3d3)),
                    onTap: () {},
                    splashColor: Colors.black,
                  ),
                  Text(
                    '0',
                    style: TextStyle(fontSize: 18, color: Color(0xffd3d3d3)),
                  ),
                  InkWell(
                    child: Icon(Icons.keyboard_arrow_down,
                        color: Color(0xffd3d3d3)),
                    onTap: () {},
                    splashColor: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  image: DecorationImage(
                    image: AssetImage('asset/images/7mam.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ]),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Suffed Piegon',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '65 EGP',
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 16.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 120.0,
                  height: 25.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Piegon",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: (){},
                            child: Text(
                              'x',
                              style: TextStyle(
                                  color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
           Spacer(),
           GestureDetector(
             child: Icon(Icons.cancel,color: Colors.grey,),
             onTap: (){},
           ),
          ],
        ),
      ),
    );
  }
}
