import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes/models/Note.dart';

class ApiService {
  static String _baseURL =
      "https://enigmatic-oasis-04169-e165d00fd656.herokuapp.com";

  

  static Future<List<Note>?> getAll() async {
    var client = http.Client();
    var uri = Uri.parse(_baseURL + "/notes/list");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List ;
      return json.map((notesJson) => Note.fromJson(notesJson)).toList();
    }
    return [];
  }


 static Future<List<Note>?> getBy(String uID) async {
    var client = http.Client();
    var uri = Uri.parse(_baseURL + "/notes/listBy");
    var response = await client.post(uri, body: {"userid": uID});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List ;
      return json.map((notesJson) => Note.fromJson(notesJson)).toList();
    }
    return [];
  }



  static Future<void> addNote(Note notes) async {
    var client = http.Client();
    var uri = Uri.parse(
      _baseURL + "/notes/add",
    );
    var response = await client.post(uri, body: notes.toJson());
    
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
    }
 
  }

  static Future<void> deleteNote(Note notes) async{
     var client = http.Client();
    var uri = Uri.parse(
      _baseURL + "/notes/delete",
    );
    var response = await client.post(uri, body: notes.toJson());
    
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
    }
  }





    
}
