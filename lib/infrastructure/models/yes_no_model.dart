// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

// import 'dart:convert';

//String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

import 'package:yes_no_app/domain/entities/massage.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  // Map<String, dynamic> toJson() => {
  //     "answer": answer,
  //     "forced": forced,
  //     "image": image,
  // };
  Message toMessageEntity() => Message(
    text: answer=='yes'?'Si':'No', 
    fromWho: FromWho.her,
    imageUrl: image
    );
}
