import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post{
  @JsonKey(name: "userId")
  int userID;
  int id;
  String title;
  String body;
  Post(
    {
      required this.userID,
      required this.id,
      required this.title,
      required this.body,
    }
  );
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}