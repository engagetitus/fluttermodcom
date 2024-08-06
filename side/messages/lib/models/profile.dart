// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  final String id;
  final String fName;
  final String lName;
  final String phone;
  final String imageUrl;
  final bool verified;
  final DateTime createdAt;
  Profile({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.imageUrl,
    required this.verified,
    required this.createdAt,
  });

  Profile copyWith({
    String? id,
    String? fName,
    String? lName,
    String? phone,
    String? imageUrl,
    bool? verified,
    DateTime? createdAt,
  }) {
    return Profile(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
      verified: verified ?? this.verified,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() { // if saving to firebase (local nosql - hive)
    return <String, dynamic>{
      'id': id,
      'fName': fName,
      'lName': lName,
      'phone': phone,
      'imageUrl': imageUrl,
      'verified': verified,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      fName: map['fName'] as String,
      lName: map['lName'] as String,
      phone: map['phone'] as String,
      imageUrl: map['imageUrl'] as String,
      verified: map['verified'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap()); // sending data to api

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(id: $id, fName: $fName, lName: $lName, phone: $phone, imageUrl: $imageUrl, verified: $verified, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.fName == fName &&
      other.lName == lName &&
      other.phone == phone &&
      other.imageUrl == imageUrl &&
      other.verified == verified &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fName.hashCode ^
      lName.hashCode ^
      phone.hashCode ^
      imageUrl.hashCode ^
      verified.hashCode ^
      createdAt.hashCode;
  }
 }
