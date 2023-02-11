// To parse this JSON data, do
//
//     final TutorialModel = TutorialModelFromJson(jsonString);

import 'dart:convert';

class TutorialModel{
    TutorialModel({
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

    factory TutorialModel.fromRawJson(String str) => TutorialModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TutorialModel.fromJson(Map<String, dynamic> json) => TutorialModel(
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
