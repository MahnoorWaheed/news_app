// To parse this JSON data, do
//
//     final EventsModel = EventsModelFromJson(jsonString);

import 'dart:convert';

class EventsModel {
    EventsModel({
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

    factory EventsModel.fromRawJson(String str) => EventsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
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
