import 'package:flutter/src/widgets/container.dart';

class NewsModel {
  int? id;
  String? title;
  String? link;
  String? image;
  String? shortDescription;
  String? description;
  String? date;
  String? createdAt;
  String? updatedAt;

  NewsModel(
      {this.id,
      this.title,
      this.link,
      this.image,
      this.shortDescription,
      this.description,
      this.date,
      this.createdAt,
      this.updatedAt});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    image = json['image'];
    shortDescription = json['short_description'];
    description = json['description'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['link'] = link;
    data['image'] = image;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  map(Container Function(dynamic element) param0) {}
}
