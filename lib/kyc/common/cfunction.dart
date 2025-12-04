import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


ShowToastMsg(String msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER
  );
}


AppBar appBarCommonToHome(BuildContext context, String title) {
  return new AppBar(
    title: Text(title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.black87)),
    leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () =>{
            Navigator.pop(context),
        }

    ),
    shadowColor: Colors.grey,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black87, //change your color here
    ),
    centerTitle: false,
    elevation: 1.0,
    actions: [
      InkWell(
        onTap: () async {
        },
        child: Padding(
            padding: EdgeInsets.only(right: 20, top: 15),
            child: RichText(
              text: TextSpan(
                children: [
                ],
              ),
            )),
      )
    ],
  );
}
