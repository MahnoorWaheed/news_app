// To parse this JSON data, do
//
//     final MicroControllerModel = MicroControllerModelFromJson(jsonString);

import 'dart:convert';

class MicroControllerModel {
    MicroControllerModel({
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

    factory MicroControllerModel.fromRawJson(String str) => MicroControllerModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MicroControllerModel.fromJson(Map<String, dynamic> json) => MicroControllerModel(
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
