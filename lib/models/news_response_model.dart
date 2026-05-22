import 'package:hive/hive.dart';
part 'news_response_model.g.dart';

@HiveType(typeId: 3)
class NewsResponseModel extends HiveObject{
  NewsResponseModel({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  NewsResponseModel.fromJson(dynamic json) {
    if (json == null) return;

    final Map<String, dynamic> data = Map<String, dynamic>.from(json);

    status = data['status'];
    code = data['code'];
    message = data['message'];
    totalResults = data['totalResults'];
    if (data['articles'] != null) {
      articles = [];
      data['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @HiveField(0)
  String? status;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? message;
  @HiveField(3)
  int? totalResults;
  @HiveField(4)
  List<Articles>? articles;
}

@HiveType(typeId: 4)
class Articles extends HiveObject{
  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(dynamic json) {
    if (json == null) return;

    final Map<String, dynamic> data = Map<String, dynamic>.from(json);

    source = data['source'] != null ? Source.fromJson(data['source']) : null;
    author = data['author'];
    title = data['title'];
    description = data['description'];
    url = data['url'];
    urlToImage = data['urlToImage'];
    publishedAt = data['publishedAt'];
    content = data['content'];
  }

  @HiveField(0)
  Source? source;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? urlToImage;
  @HiveField(6)
  String? publishedAt;
  @HiveField(7)
  String? content;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source?.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

@HiveType(typeId: 5)
class Source extends HiveObject{
  Source({this.id, this.name});

  Source.fromJson(dynamic json) {
    if (json == null) return;

    final Map<String, dynamic> data = Map<String, dynamic>.from(json);

    id = data['id'];
    name = data['name'];
  }

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}