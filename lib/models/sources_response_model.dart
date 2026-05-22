class SourcesResponseModel {
  String? status;
  String? code;
  String? message;
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

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
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