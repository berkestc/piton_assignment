import 'package:json_annotation/json_annotation.dart';

class LikeCountConverter extends JsonConverter<int, Map<String, dynamic>> {
  const LikeCountConverter();

  @override
  int fromJson(Map<String, dynamic> json) {
    return (json["aggregate"] as Map<String, dynamic>)["count"] as int;
  }

  @override
  Map<String, dynamic> toJson(int object) {
    return {"likeCount": object};
  }
}
