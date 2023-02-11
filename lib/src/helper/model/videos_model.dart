// To parse this JSON data, do
//
//     final VideoModel = VideoModelFromJson(jsonString);

import 'dart:convert';

class VideoModel {
    VideoModel({
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

    factory VideoModel.fromRawJson(String str) => VideoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
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
