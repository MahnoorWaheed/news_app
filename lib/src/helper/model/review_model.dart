// To parse this JSON data, do
//
//     final ReviewModel = ReviewModelFromJson(jsonString);

import 'dart:convert';

class ReviewModel {
    ReviewModel({
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

    factory ReviewModel.fromRawJson(String str) => ReviewModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
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
