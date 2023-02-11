// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

class NewsModel {
    NewsModel({
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

    factory NewsModel.fromRawJson(String str) => NewsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
