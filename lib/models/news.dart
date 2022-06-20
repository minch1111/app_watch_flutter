import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class Blog {
  String? Id;
  String? Title;
  String? Author;
  String? Content;
  String? Thumbnail;
  int? IsShow;
  String? CreatedByName;
  String? CreatedByTime;
  String? CreatedByID;
  String? UpdatedByName;
  String? UpdatedByTime;
  String? UpdatedByID;

  Blog(
    this.Id,
    this.Title,
    this.Author,
    this.Content,
    this.Thumbnail,
    this.IsShow,
    this.CreatedByName,
    this.CreatedByTime,
    this.CreatedByID,
    this.UpdatedByName,
    this.UpdatedByTime,
    this.UpdatedByID,
  );

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}
