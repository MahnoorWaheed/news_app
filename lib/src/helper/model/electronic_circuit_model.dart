// To parse this JSON data, do
//
//     final electronicCircuitModel = electronicCircuitModelFromJson(jsonString);

import 'dart:convert';

class ElectronicCircuitModel {
    ElectronicCircuitModel({
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

    factory ElectronicCircuitModel.fromRawJson(String str) => ElectronicCircuitModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ElectronicCircuitModel.fromJson(Map<String, dynamic> json) => ElectronicCircuitModel(
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
