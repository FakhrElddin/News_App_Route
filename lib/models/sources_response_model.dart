import 'package:hive/hive.dart';
part 'sources_response_model.g.dart';

@HiveType(typeId: 1)
class SourcesResponseModel extends HiveObject{
  @HiveField(0)
  String? status;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? message;
  @HiveField(3)
  List<Sources>? sources;

  SourcesResponseModel({this.status, this.sources, this.code, this.message});

  SourcesResponseModel.fromJson(dynamic json) {
    if (json == null) return;

    final Map<String, dynamic> data = Map<String, dynamic>.from(json);

    status = data['status'];
    code = data['code'];
    message = data['message'];
    if (data['sources'] != null) {
      sources = <Sources>[];
      data['sources'].forEach((v) {
        sources!.add(Sources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Sources extends HiveObject{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? language;
  @HiveField(6)
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Sources.fromJson(dynamic json) {
    if (json == null) return;

    final Map<String, dynamic> data = Map<String, dynamic>.from(json);

    id = data['id'];
    name = data['name'];
    description = data['description'];
    url = data['url'];
    category = data['category'];
    language = data['language'];
    country = data['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    data['category'] = category;
    data['language'] = language;
    data['country'] = country;
    return data;
  }
}