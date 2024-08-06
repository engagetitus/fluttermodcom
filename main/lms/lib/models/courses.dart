// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Courses {
  final String id;
  final String code;
  final String name;
  final String description;
  final List<Resources> topics;
  final DateTime createdAt;
  final DateTime? updatedAt;
  Courses({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.topics,
    required this.createdAt,
    this.updatedAt,
  });

  String fees() {
    return 'Free';
  }

  Courses copyWith({
    String? id,
    String? code,
    String? name,
    String? description,
    List<Resources>? topics,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Courses(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      topics: topics ?? this.topics,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'description': description,
      'topics': topics.map((x) => x.toMap()).toList(),
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Courses.fromMap(Map<String, dynamic> map) {
    return Courses(
      id: map['id'] as String,
      code: map['code'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      topics: List<Resources>.from(
        (map['topics'] as List<dynamic>).map<Resources>(
          (x) => Resources.fromMap(x as Map<String, dynamic>),
        ),
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Courses.fromJson(String source) =>
      Courses.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Courses(id: $id, code: $code, name: $name, description: $description, topics: $topics, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Courses other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.code == code &&
        other.name == name &&
        other.description == description &&
        listEquals(other.topics, topics) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        name.hashCode ^
        description.hashCode ^
        topics.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}

class Resources {
  final String url;
  final bool isAvailable;
  final String title;
  Resources({
    required this.url,
    required this.isAvailable,
    required this.title,
  });

  Resources copyWith({
    String? url,
    bool? isAvailable,
    String? title,
  }) {
    return Resources(
      url: url ?? this.url,
      isAvailable: isAvailable ?? this.isAvailable,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'isAvailable': isAvailable,
      'title': title,
    };
  }

  factory Resources.fromMap(Map<String, dynamic> map) {
    return Resources(
      url: map['url'] as String,
      isAvailable: map['isAvailable'] as bool,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Resources.fromJson(String source) =>
      Resources.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Resources(url: $url, isAvailable: $isAvailable, title: $title)';

  @override
  bool operator ==(covariant Resources other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.isAvailable == isAvailable &&
        other.title == title;
  }

  @override
  int get hashCode => url.hashCode ^ isAvailable.hashCode ^ title.hashCode;
}
