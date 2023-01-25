import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMsg {
  ToastMsg(String msg, fToast) {
    fToast!.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white10,
          ),
          child: Text(
            msg,
            style: TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        ),

        // toastDuration: Duration(seconds: 2),
        gravity: ToastGravity.BOTTOM,
        positionedToastBuilder: (context, child) {
          return Positioned(
            bottom: 100.0,
            right: 0.0,
            left: 0.0,
            child: child,
          );
        });
  }
}
