// To parse this JSON data, do
//
//     final EventModel = EventModelFromJson(jsonString);

import 'dart:convert';

class EventModel {
    EventModel({
        this.title,
        this.body,
        this.fieldImage,
        this.fieldTags,
        this.nid,
    });

    String? title;
    String? body;
    String? fieldImage;
    String? fieldTags;
    String? nid;

    factory EventModel.fromRawJson(String str) => EventModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        title: json["title"],
        body: json["body"],
        fieldImage: json["field_image"],
        fieldTags: json["field_tags"],
        nid: json["nid"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "field_image": fieldImage,
        "field_tags": fieldTags,
        "nid": nid,
    };
}
