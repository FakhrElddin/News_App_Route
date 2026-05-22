class NewsResponseModel {
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

  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<Articles>? articles;
}

class Articles {
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

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
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

class Source {
  Source({this.id, this.name});

  Source.fromJson(dynamic json) {
    if (json == null) return;

    final Map<String, dynamic> data = Map<String, dynamic>.from(json);

    id = data['id'];
    name = data['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}