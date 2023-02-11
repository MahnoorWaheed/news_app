// To parse this JSON data, do
//
//     final ArticleModel = ArticleModelFromJson(jsonString);

import 'dart:convert';

class ArticleModel {
    ArticleModel({
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

    factory ArticleModel.fromRawJson(String str) => ArticleModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
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
