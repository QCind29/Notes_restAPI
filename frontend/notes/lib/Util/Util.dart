import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/Note.dart';
import 'package:notes/pages/add_new_note_page.dart';
import 'package:notes/providers/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sprintf/sprintf.dart';



formattedDate(DateTime date ){
  int a = date.day;
  int b = date.month;
  int c = date.year;

  String d = sprintf('%02d-%02d-%04d', [a, b, c]);

  return d;

}



void showDeleteToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(   
      const SnackBar(content: Text("Delete note successfully"),
      duration: Duration(seconds: 2),
      ));
}

void showAddToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(   
      const SnackBar(content: Text("Note added successfully"),
      duration: Duration(seconds: 2),
      ));
}

void showUpdateToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(   
      const SnackBar(content: Text("Note updated successfully"),
      duration: Duration(seconds: 2),
      ));
}



 void showToast() {
    Fluttertoast.showToast(
      msg: 'Delete note successfully',
      toastLength: Toast.LENGTH_SHORT, // Thời gian hiển thị của toast
      gravity: ToastGravity.BOTTOM, // Vị trí hiển thị của toast
      backgroundColor: Colors.black54, // Màu nền của toast
      textColor: Colors.white, // Màu chữ của toast
      fontSize: 16.0, // Cỡ chữ của toast
    );
  }