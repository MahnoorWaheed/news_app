// To parse this JSON data, do
//
//     final ForumModel = ForumModelFromJson(jsonString);

import 'dart:convert';

class ForumModel {
    ForumModel({
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

    factory ForumModel.fromRawJson(String str) => ForumModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ForumModel.fromJson(Map<String, dynamic> json) => ForumModel(
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
