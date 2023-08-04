
import 'dart:convert';


List<Note> NoteFromJson(String str) => List<Note>.from(json.decode(str).map((x)=>Note.fromJson(x)));

String NoteToJson(List<Note> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Note {
    String id;
    String userid;
    String title;
    String content;
    DateTime dateadded;

    Note({
        required this.id,
        required this.userid,
        required this.title,
        required this.content,
        required this.dateadded,
    });

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        userid: json["userid"],
        title: json["title"],
        content: json["content"],
        dateadded: DateTime.parse(json["dateadded"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "title": title,
        "content": content,
        "dateadded": dateadded.toIso8601String(),
    };

}
